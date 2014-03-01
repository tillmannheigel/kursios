class RemoveColumnContributionIdFromWorksheets < ActiveRecord::Migration
  def change
        remove_column :worksheets, :attachment_id
        remove_column :worksheets, :contribution_id

  end
end
