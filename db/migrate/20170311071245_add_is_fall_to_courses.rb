class AddIsFallToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :is_fall, :boolean
  end
end
