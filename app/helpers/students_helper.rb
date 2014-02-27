module StudentsHelper
  
    def courses
      courses = []
    #<!--current courses-->
    if admin_signed_in?
      courses = Student.find(params[:id]).courses.to_a
    elsif student_signed_in?
    #<!--student courses-->
    if current_student.id == @student.id
       courses = Student.find(params[:id]).courses.to_a
    else
    #<!--same courses-->
    a = Student.find(params[:id]).courses.to_a
    b = current_student.courses.to_a
    courses = a & b
    end
    end
    return courses
  end
  
  
end
