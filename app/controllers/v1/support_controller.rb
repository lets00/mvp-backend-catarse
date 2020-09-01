class V1::SupportController < ApplicationController
    skip_before_action :authorized, only: [:show]

    def show
        @supports = Support.where(project_id: params[:id])
        render json: @supports, status: :ok
    end

    def create
        json_support = support_params
        json_support['user_id'] = actual_user_id
        @support = Support.new(json_support)
        if @support.valid?
            @project = Project.find(params[:project_id])
            if @project
                @support.save
                render json: @support, status: :ok                
            end            
        else
            render json: @support.errors.messages, status: :bad_request
        end
    end

    private
    def support_params
        params.require(:support).permit(:value, :project_id)
    end

    def is_valid_date(finnish_date)
        Time.now.to_i > Time.parse(finnish_date).to_i
    end
end
