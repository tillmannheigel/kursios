class AddDescriptionToWorksheet < ActiveRecord::Migration
  def change
    add_column :worksheets, :description, :string
  end
end
