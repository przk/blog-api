class Api::V1::AuthenticationController < Api::V1::ApplicationController
    before_action :authorize_request, except: :login

    def login
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            render json: { token: token, exp: time.strftime("%Y-%m-%d %H:%M"), name: @user.name, role: @user.role }, status: :ok
        else
            render json: { error: 'unauthorized '}, status: :unauthorized
        end
    end

    private

    def login_params
        params.permit(:email, :password)
    end
end
