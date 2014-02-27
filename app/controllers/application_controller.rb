class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  
      def require_login
      unless student_signed_in? || admin_signed_in?
        redirect_to  new_student_session_path
        flash[:error] = "Bitte erst einloggen!"
      end
    end
    
    def require_admin
      unless admin_signed_in?
        redirect_to root_path
        flash[:error] = "Nur als Admin möglich!"
      end
    end

 end
