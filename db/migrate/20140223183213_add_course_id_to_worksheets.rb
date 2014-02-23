class AddCourseIdToWorksheets < ActiveRecord::Migration
  def change
    add_column :worksheets, :course_id, :integer
  end
end
