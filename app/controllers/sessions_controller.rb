class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email])
        if !user
            flash.now[:danger] = "Email not registered."
            render 'new'
        elsif user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash.now[:success] = "You have logged in."
            redirect_to user_path(user)
        else 
            flash.now[:danger] = "Incorrect password."
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You have logged out."
        redirect_to root_path
    end
end