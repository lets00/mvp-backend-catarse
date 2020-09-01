class V1::ProjectsController < ApplicationController
    skip_before_action :authorized, only: [:index]
    def index
        @projects = Project.all
        render json: @projects, status: :ok
    end
end
