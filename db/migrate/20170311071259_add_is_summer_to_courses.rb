class AddIsSummerToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :is_summer, :boolean
  end
end
