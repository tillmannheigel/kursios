class AddMatrnrToStudents < ActiveRecord::Migration
  def change
    add_column :students, :matrNr, :string
  end
end
