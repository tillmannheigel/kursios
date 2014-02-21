  require 'bcrypt'

class UsersController < ApplicationController
  include BCrypt
    
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user].permit(:email,:password,:password_confirmation))
    if @user.save
      redirect_to root_path
      flash[:notice] = "Thank you, new user has been generated"
    else
      redirect_to root_path
      flash[:error] = "Something went wrong"
    end
  end
end
