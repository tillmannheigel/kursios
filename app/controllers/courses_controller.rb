class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
  end
  
  def new
    @course = Course.new
    @tutors = Tutor.all :select => 'email, id'
  end
  
  def create
    @course = Course.new(:name => params[:course][:name], :tutor_id => params[:tutor][:tutor_id])
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
