class ApplicationController < ActionController::Base

    helper_method :current_user

    def current_user
      if session[:user_email]
        @current_user  = Employee.find_by(email:session[:user_email]) || Customer.find_by(email:session[:user_email])
      end
    end 

    def log_in(user)
        session[:user_email] = user.email
        @current_user = user
        redirect_to @current_user
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete(:user_email)
        @current_user = nil
    end
  
end
