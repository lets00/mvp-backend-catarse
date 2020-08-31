class V1::ProjectController < ApplicationController
    def index
        @projects = Project.all
        render json: @projects, status: :ok
    end
end
