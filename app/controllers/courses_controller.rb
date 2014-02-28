class CoursesController < ApplicationController
  def index
    @courses = []
    if admin_signed_in?
      @courses = Course.all
    elsif student_signed_in?
      @courses = current_student.courses
    else
    end
  end

  def show
    @course = Course.find(params[:id])
    @tutors = Tutor.all
  end
  
  def new
    @course = Course.new
    @tutors = Tutor.all :select => 'email, id'
  end
  
  def create
    @course = Course.new(:name => params[:course][:name], :tutor_id => params[:course][:tutor_id])
    if @course.save
      redirect_to courses_path
      flash[:notice] = "Course has been generated."
    else
      redirect_to courses_path
      flash[:error] = "Course has NOT been generated."
    end
  end
  
  def edit
     @course = Course.find(params[:id])
     @tutors = Tutor.all :select => 'email, id'
  end
  
    def update
    @course = Course.find(params[:id])
    @course.assign_attributes(:name => params[:course][:name], :tutor_id => params[:course][:tutor_id])
    if @course.save
      redirect_to courses_path
      flash[:notice] = "Course has been updated."
    else
      redirect_to courses_path
      flash[:error] = "Course has NOT been u."
    end
  end
  
  def destroy
     @course = Course.find(params[:id])
    if @course.destroy
      redirect_to courses_path
      flash[:notice] = "Course has been deleted."
    else
      redirect_to courses_path
      flash[:error] = "Course has NOT been deleted."
    end  end

end
