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
            # Verify if finnish date was reached
            f_finnish_date = Time.parse(@project.finnish_date).to_i
            if Time.now.to_i <= f_finnish_date
                @support.save
                render json: @support, status: :ok
            else
                render json: {message: "Finnish date was reached"}, status: :bad_request
            end                          
        else
            render json: @support.errors.messages, status: :bad_request
        end
    end

    private
    def support_params
        params.require(:support).permit(:value, :project_id)
    end
end
