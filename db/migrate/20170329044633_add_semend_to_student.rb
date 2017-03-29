class AddSemendToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :semend, :string
  end
end
