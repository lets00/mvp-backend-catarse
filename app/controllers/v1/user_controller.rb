class V1::UserController < ApplicationController
    skip_before_action :authorized
    def show
        @user = User.find_by(id: params[:id])
        if @user
            render json: {username: @user['username']}, status: :ok
        else
            head(:not_found)
        end
    end

    def projects
        @projects = Project.where(user_id: params[:id])
        render json: @projects, status: :ok
    end

    def supports
        @supports = Support.where(user_id: params[:id])
        render json: @supports, status: :ok
    end
end
