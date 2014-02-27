class AddWorksheetIdToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :worksheet_id, :integer
  end
end
