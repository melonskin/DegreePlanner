class AddYearendToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :yearend, :integer
  end
end
