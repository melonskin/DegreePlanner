class ChangeF1NameInStudent < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :f1status
  end
end
