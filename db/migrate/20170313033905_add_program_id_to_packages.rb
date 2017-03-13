class AddProgramIdToPackages < ActiveRecord::Migration[5.0]
  def change
    add_column :packages, :program_id, :integer
  end
end
