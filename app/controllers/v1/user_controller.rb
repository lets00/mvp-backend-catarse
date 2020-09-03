class V1::UserController < ApplicationController
    skip_before_action :authorized
    def index
        @user = User.find_by(id: params[:id])
        render json: {username: @user['username']}, status: :ok
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
