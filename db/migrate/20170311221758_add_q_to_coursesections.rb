class AddQToCoursesections < ActiveRecord::Migration[5.0]
  def change
    add_column :coursesections, :q, :string
  end
end
