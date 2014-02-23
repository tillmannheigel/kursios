class StudentsController < ApplicationController
    
  before_filter :require_admin, only: [:index, :new, :create]

  def show
    @student = Student.find(params[:id])
    @all_courses = Course.all
    @courses = @student.courses.to_a
  end
  

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
  
  def updateCourses
    student = Student.find(params[:id])
    if student.courses.clear
      checks = params[:checks]
      if checks
        checks.each do |check|
        student.courses << Course.find(check)
        end
      end
      if student.save
        redirect_to student_path(params[:id])
        flash[:notice] = "User has been updated."
      else
        redirect_to student_path(params[:id])
        flash[:error] = "User has not been updated...oh my dear, what a mess :("
      end
    else
     redirect_to student_path(params[:id])
        flash[:error] = "User has not been updated...oh my dear, what a mess :("
    end   
  end 
  
end
