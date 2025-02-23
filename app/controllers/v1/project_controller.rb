class V1::ProjectController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    def index
        @projects = Project.where("title LIKE ?", "%#{params[:title]}%").limit(params[:limit] || 10).offset(params[:skip] || 0)
        render json: @projects, status: :ok
    end

    def show
        @project = Project.find_by(id: params[:id])
        render json: @project, status: :ok
    end

    def create
        project_json = project_params
        project_json['user_id'] = actual_user_id
        @project = Project.new(project_json)
        if @project.valid?
            @project.save
            render json: @project, status: :ok
        else
            render json: @project.errors.messages, status: :bad_request
        end
    end

    def update
        @project = Project.find_by(id: params[:id], user_id: actual_user_id)
        if @project
            if @project.update_attributes(project_params)
                render json: @project, status: :ok
            else
                head(:bad_request)
            end
        else
            head(:not_found)
        end
    end

    def destroy
        @project = Project.find_by(id: params[:id], user_id: actual_user_id)
        if @project && @project.destroy
            head(:ok)
        else
            head(:unprocessable_entity)
        end
    end

    private
    def project_params
        params.require(:project).permit(:title, :description, :image_url, :goal, :finnish_date)
    end
end
