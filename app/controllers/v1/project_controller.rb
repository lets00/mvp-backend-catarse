class V1::ProjectController < ApplicationController
    def index
        @projects = Project.where(user_id: actual_user_id)
        render json: @projects, status: :ok
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
