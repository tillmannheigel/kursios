class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :attachment_id
      t.integer :group_id
      t.integer :worksheet_id
      t.string :notes

      t.timestamps
    end
  end
end
