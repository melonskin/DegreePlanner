class RemoveNumberFromPackages < ActiveRecord::Migration[5.0]
  def change
    remove_column :packages, :number, :integer
  end
end
