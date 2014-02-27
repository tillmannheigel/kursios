class AddUsernameToTutor < ActiveRecord::Migration
  def change
    add_column :tutors, :username, :string
  end
end
