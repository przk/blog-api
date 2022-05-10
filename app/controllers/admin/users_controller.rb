class Admin::UsersController < ApplicationController
    before_action :authorize_request, except: :create
    before_action :find_user, except: %i[update index show adminpatch thisuser]

    def show
        @user = User.find(params['id'])
        render json: @user
    end
    
    def update
        authorize User
        @user = User.find(params['id'])
        unless @user.update(user_params)
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
        render json: { message: 'edited' }
    end

    def adminpatch
        authorize User
        @user = User.find(params['id'])
        @user.email = params['email']
        @user.role = params['role']
        if @user.save
            render json: @user, status: :ok
        else
            render json: { errors: 'failed' }, status: :unprocessable_entity
        end
    end

    def thisuser
        authorize User
        render json: @current_user
    end

    def destroy
        @user.destroy
    end

    private

    def find_user
        @user = User.find_by_name!(params[:_name])
    rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
    end

    def user_params
        params.permit(:email, :name, :password, :password_confirmation)
    end
end