class StudentsController < ApplicationController
      before_filter :set_no_cache, only: [:show, :updateCourses]
      before_filter :require_admin, only: [:destroy]


  def show
    @student = Student.find(params[:id])
    @courses = @student.courses.to_a
  end
  
    def edit
    @student = Student.find(params[:id])
    @all_courses = Course.all
    @courses = @student.courses.to_a
  end
  

  def index
    @students = []
    if admin_signed_in?
    @students = Student.all
    elsif student_signed_in? 
     Student.all.each do |s|
       begin
        next if (@students.include? s)
        s.courses.all.each do |c|
        if current_student.courses.all.include? c
         @students << s 
         break
        end
       end
      end
     end
    else
    end
  end
  
  def new
    @student = Student.new
  end
  
  def create
    email = params[:email]
    logger.debug("email ist " << email)
    generated_password = Devise.friendly_token.first(8)
    if Student.create!(:email => email, :password => generated_password)
      #RegistrationMailer.welcome(user, generated_password).deliver
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
      student.email = params[:email]
      checks = params[:checks]
      if checks
        checks.each do |check|
        student.courses << Course.find(check)
        end
      end
      if student.save
        redirect_to edit_student_path(params[:id])
        flash[:notice] = "User has been updated."
      else
        redirect_to edit_student_path(params[:id])
        flash[:error] = "User has not been updated...oh my dear, what a mess :("
      end
    else
     redirect_to edit_student_path(params[:id])
        flash[:error] = "User has not been updated...oh my dear, what a mess :("
    end   
  end 
  
  def set_no_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  
    def destroy
     @student = Student.find(params[:id])
    if @student.destroy
      redirect_to students_path
      flash[:notice] = "Student has been deleted."
    else
      redirect_to students_path
      flash[:error] = "Student has NOT been deleted."
    end  end
  
  def sendMessage
      redirect_to :back
      flash[:notice] = "Messaging is not implemented yet."
  end
end
