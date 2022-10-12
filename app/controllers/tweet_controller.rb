class TopController < ApplicationController
    # session[:login_uid]がnilでなければ main.html.erbを、nilなら login.html.erbをrenderする。
    require 'bcrypt'
    def main
        session[:login_uid] ||= nil
        if session[:login_uid]
            render "main"
        else
            render "login"
        end
    end
    def new
        @user = User.new
    end
    def create
        pass = BCrypt::Password.create(params[:pass])
        @user = User.new(uid: params[:uid], pass: pass)
        if @user.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    def login 
        @user = User.find_by(uid: params[:uid])
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
    def account_delete
        @user = User.find_by(uid: session[:login_uid])
    end
end