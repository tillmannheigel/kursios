class SessionsController < ApplicationController
  def new
  end
        
  def create
      user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
          sleep 2
          session[:user_id] = user.id
          redirect_to worksheets_path
          flash[:notice] = "Thank you are now logged in..."
        else
          sleep 2
          redirect_to new_session_path
          flash[:error] = "E-Mail-Adresse oder Passwort falsch"
        end
  end

  def destroy
       session[:user_id] = nil
       redirect_to worksheets_path,
       flash[:notice] = "You are now logged out..."
  end
end
