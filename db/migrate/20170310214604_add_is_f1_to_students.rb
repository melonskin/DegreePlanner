class AddIsF1ToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :is_f1, :string
  end
end
