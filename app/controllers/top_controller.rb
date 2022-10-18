class TopController < ApplicationController
    def main
        session[:login_uid] ||= nil
        if session[:login_uid]
            render "main"
        else
            render "login"
        end
    end
    def login
        @user = User.find_by(uid: params[:uid])
        @user_all = User.all
        if @user
            if BCrypt::Password.new(@user.pass) == params[:pass]
                session[:login_uid] = params[:uid]
                redirect_to root_path
            end
        else
            render "error"
        end
    end
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end
