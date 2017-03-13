class AddNoRequiredToPackages < ActiveRecord::Migration[5.0]
  def change
    add_column :packages, :no_required, :integer
  end
end
