class AddSemstartToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :semstart, :string
  end
end
