class UsersController < ApplicationController
    def index
        @user = User.all
        @tweets = Tweet.all
    end
    def new
        @user = User.new
    end
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to root_path
    end
    def create
        uid = params[:uid]
        pass = BCrypt::Password.create(params[:pass])
        @user = User.new(uid: uid, pass: pass)
        if @user.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    def delete
        @users = User.all
    end
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to root_path
    end
end
