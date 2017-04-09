class CreateSpecialCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :special_courses do |t|
      t.string :department
      t.integer :number
      t.string :name
      t.string :description
      t.string :is_fall
      t.string :is_spring
      t.string :is_summer

      t.timestamps
    end
  end
end
