class AddStudentIdToContribution < ActiveRecord::Migration
  def change
    add_column :contributions, :student_id, :integer
  end
end
