class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users, include: :playlists
    end

    def show
        @user = User.find_by(id:params[:id])
        render json: @user, include: :playlists
    end

    def create
        user = User.create!(user_params)
        render json: user, include: :playlists
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
