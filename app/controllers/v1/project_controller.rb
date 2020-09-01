class V1::ProjectController < ApplicationController
    def index
        @projects = Project.where(user_id: actual_user_id)
        render json: @projects, status: :ok
    end

    def create
        # actual_data < finnish_data < actual_data + 30 days
        actual_data = Time.now.to_i
        latest_data = actual_data + 30.days.ago.to_i
        if params[:finnish_date] > actual_data && params[:finnish_date] <= latest_data
            project_json = project_params
            project_json['user_id'] = actual_user_id
            @project = Project.new(project_json)
            @project.save
            render json: @project, status: :ok
        else
            render json: {message: "finnish_data must be  > #{actual_data}(today) and <= #{latest_data}(30 days later)"}, status: :bad_request
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
