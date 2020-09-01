class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, 's3cr3t@ndStr0ngK3y')
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            # headers = {'Authorization': 'Bearer <token>'}
            token = auth_header.split(' ')[1]
            begin
                s = JWT.decode(token, 's3cr3t@ndStr0ngK3y')[0]
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def actual_user_id
        if decoded_token
            # {user_id: x, username: x, alg: x}]
            user_id = decoded_token['user_id']
        end
    end

    def logged?
        !!actual_user_id
    end

    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged?
    end
end
