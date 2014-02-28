class AddCourseIdToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :course_id, :integer
  end
end
