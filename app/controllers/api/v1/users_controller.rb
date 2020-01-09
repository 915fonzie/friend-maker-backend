class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    wrap_parameters format: [:json]

    def index
        @users = User.all
        render json: @users
    end

    def show
        render json: @user
    end

    def create
        @user = User.create(user_params)
        render json: @user
    end

    def update
        @user.update(user_params)
        render json: @user
    end

    def destroy
        @user.destroy
    end

    def find_from_greatest
        matched_users = User.tagged_with(params[:filtered_interests])
        sorted_users = User.sort_users_from_greatest(matched_users)
        render json: {
            users: sorted_users.as_json(except: [:first_name, :last_name, :email, :password_digest, :created_at, :updated_at, :tag_list])
        }
    end

    def find_from_least
        matched_users = User.tagged_with(params[:filtered_interests])
        sorted_users = User.sort_users_from_least(matched_users)
        render json: {
            users: sorted_users.as_json(except: [:first_name, :last_name, :email, :password_digest, :created_at, :updated_at, :tag_list])
        }
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :bio, :ideal_friend_bio, :interest_list)
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end
end
