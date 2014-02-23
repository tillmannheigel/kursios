class DropOwnerAndNameFromCourses < ActiveRecord::Migration
  def change
        remove_column :courses, :owner
        remove_column :courses, :admin_id
        
        add_column :courses, :tutor_id, :integer

  end
end
