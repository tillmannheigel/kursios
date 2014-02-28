class CreateStudentsGroups < ActiveRecord::Migration
  def change
    create_table :students_groups do |t|
      t.integer :course_id
      t.integer :student_id
    end
  end
end
