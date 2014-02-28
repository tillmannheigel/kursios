class DropWorksheetIdFromAttachments < ActiveRecord::Migration
  def change
    remove_column :attachments, :worksheet_id
      add_column :attachments, :attachable_id, :integer
      add_column :attachments, :attachable_type, :string
     end
   
end
