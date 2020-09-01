class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, 's3cr3t@ndStr0ngK3y')
    end

    def auth_header
        request.headers['Authorization']
    end
    
    def decoded_token(token)
        JWT.decode(token, 's3cr3t@ndStr0ngK3y')[0]
    end
end
