class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
        render json: {
            users: @users
        }
    end

    def show
        render json: {
            user: @user
        }
    end

    def create
        @user = User.create(user_params)
        render json: @user
    end

    def edit

    end

    def update
        @user.update(user_params)
    end

    def destroy
        @user.destroy
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :bio, :ideal_friend_bio)
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end
end
