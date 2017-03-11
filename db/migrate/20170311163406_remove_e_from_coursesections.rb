class RemoveEFromCoursesections < ActiveRecord::Migration[5.0]
  def change
    remove_column :coursesections, :e, :string
  end
end
