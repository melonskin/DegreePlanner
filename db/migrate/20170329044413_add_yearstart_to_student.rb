class AddYearstartToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :yearstart, :string
  end
end
