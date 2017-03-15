class RemovePasswordFromStudents < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :password, :string
  end
end
