class V1::ProjectController < ApplicationController
    def index
        @projects = Project.where(user_id: actual_user_id)
        render json: @projects, status: :ok
    end

    def create
        @project = Project.new(project_params)
        @project.save
        render json: @project, status: :ok
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
        params.require(:project).permit(:title, :description, :image_url, :meta, :finnish_date)
    end
end
