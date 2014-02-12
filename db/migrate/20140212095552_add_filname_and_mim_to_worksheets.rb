class AddFilnameAndMimToWorksheets < ActiveRecord::Migration
  def change
    add_column :worksheets, :filename, :string
    add_column :worksheets, :mime_type, :string
  end
end
