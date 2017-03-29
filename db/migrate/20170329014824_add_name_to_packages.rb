class AddNameToPackages < ActiveRecord::Migration[5.0]
  def change
    add_column :packages, :name, :string
  end
end
