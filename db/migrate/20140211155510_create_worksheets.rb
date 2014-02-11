class CreateWorksheets < ActiveRecord::Migration
  def change
    create_table :worksheets do |t|
      t.string :title
      t.integer :max_points
      t.date :filling_date
      t.binary :data

      t.timestamps
    end
  end
end
