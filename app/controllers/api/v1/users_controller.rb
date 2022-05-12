class Api::V1::UsersController < Api::V1::ApplicationController
    before_action :authorize_request, except: :create
    before_action :find_user, except: %i[create index]

    def index
        authorize User
        @users = User.all.as_json(only: [:id, :name, :email, :created_at, :role])
        render json: @users, status: :ok
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user.as_json(only: [:id, :name, :email, :created_at, :role]), status: :created
        else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def find_user
        @user = User.find_by_name!(params[:_name])
    rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
    end

    def user_params
        puts("\n\n\nParams:"+params.to_s+"\n\n\n")
        params.permit(:email, :name, :password, :password_confirmation)
    end
end
