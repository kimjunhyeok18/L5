class UsersController < ApplicationController
    def index
        #new
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
        @user = user.new(message: params[:user][:message], tdate: Time.current, image: image)
        if @user.save
            #redirect_to '/'
            redirect_to root_path
            #redirect_to controller: :users, action: :index #=>一覧ページにリダイレクトする
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
