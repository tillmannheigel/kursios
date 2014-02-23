class StudentsController < ApplicationController
    
  before_filter :require_admin, only: [:index, :new, :create]

  def index
    @students = Student.all
  end
  
  def new
    @student = Student.new
  end
  
  def create
    email = params[:email]
    logger.debug("email ist " << email)
    generated_password = Devise.friendly_token.first(8)
    if Student.create!(:email => email, :password => generated_password)
      RegistrationMailer.welcome(user, generated_password).deliver
      redirect_to students_path
      flash[:notice] = "User has been generated. PW: " << generated_password
    else
      redirect_to students_path
      flash[:error] = "User has not been generated...oh my dear :("
    end
  end
  
end
