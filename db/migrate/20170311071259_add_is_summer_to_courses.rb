class AddIsSummerToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :is_summer, :string
  end
end
