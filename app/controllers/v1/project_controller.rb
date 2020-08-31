class V1::ProjectController < ApplicationController
    def index
        @projects = Project.all
        render json: @projects, status: :ok
    end

    def create
        @project = Project.new(project_params)
        @project.save
        render json: @project, status: :ok
    end

    def destroy
        @project = Project.find(params[:id])
        if @project.destroy
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
