class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :department
      t.integer :number
      t.string :name
      t.integer :credit
      t.text :prerequisite

      t.timestamps
    end
  end
end
