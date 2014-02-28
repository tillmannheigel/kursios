class AddContributionIdToWorksheets < ActiveRecord::Migration
  def change
    add_column :worksheets, :contribution_id, :integer
  end
end
