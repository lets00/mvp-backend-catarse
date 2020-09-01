class V1::AuthController < ApplicationController
    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id, username: params[:username]})
            render json: {user: params[:username], jwt: token}, status: :ok
        else
            render json: {message: "Invalid username or password"}, status: :unauthorized
        end
    end
end
