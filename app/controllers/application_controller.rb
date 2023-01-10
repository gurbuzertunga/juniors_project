class ApplicationController < ActionController::Base

    helper_method :current_user

    def current_user
      if session[:user_id]
        @current_user  = Employee.find(session[:user_id])
      end
    end 

    def log_in(user)
        session[:user_id] = user.id
        @current_user = user
        redirect_to @current_user
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
