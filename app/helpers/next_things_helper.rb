module NextThingsHelper
  
  def next_three_worksheets
    if student_signed_in?
    return current_student.first_worksheets(3)
    end
  end
   
end
