class ApplicationController < ActionController::API
    # include JWTSessions::RailsAuthorization
    # rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
    include Pundit::Authorization

    def not_found
        render json: { error: 'not_found'}
    end

    def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
            @decoded = JsonWebToken.decode(header)
            @current_user = User.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => exception
            render json: { errors: exception.message }, status: :unauthorized
        rescue JWT::DecodeError => exception
            render json: { errors: exception.message }, status: :unauthorized
        end
    end

    def current_user
        @current_user
    end

    # private
    # def not_authorized
    #     render json: { error: 'Not authorized!'}, status: :unauthorized
    # end
end
