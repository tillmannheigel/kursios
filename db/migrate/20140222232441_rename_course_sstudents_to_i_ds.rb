class RenameCourseSstudentsToIDs < ActiveRecord::Migration
  def change    
    rename_column :courses_students, :student, :student_id
    rename_column :courses_students, :course, :course_id
  end
end
