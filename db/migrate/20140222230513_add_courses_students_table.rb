class AddCoursesStudentsTable < ActiveRecord::Migration
  def change
        create_table :courses_students do |t|
      t.integer :course
      t.integer :student
      end
  end
end
