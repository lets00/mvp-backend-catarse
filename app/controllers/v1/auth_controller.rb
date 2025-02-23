class V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user_id: @user['id'], jwt: token}, status: :ok
        else
            render json: {message: "Invalid username or password"}, status: :unauthorized
        end
    end
end
