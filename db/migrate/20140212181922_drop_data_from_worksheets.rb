class DropDataFromWorksheets < ActiveRecord::Migration
  def change
    remove_column :worksheets, :data
    remove_column :worksheets, :mime_type
    remove_column :worksheets, :filename

    add_column :worksheets, :attachment_id, :integer
  end
end
