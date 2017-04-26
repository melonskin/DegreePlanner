class AddHasPriorMasterToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :has_prior_master, :string
  end
end
