class CreateCoursesections < ActiveRecord::Migration[5.0]
  def change
    create_table :coursesections do |t|
      t.string :department
      t.integer :number
      t.integer :section
      t.string :instructor
      t.string :term
      t.integer :year
      t.float :gpa
      t.integer :student
      t.string :a
      t.string :b
      t.string :c
      t.string :d
      t.string :e
      t.string :f
      t.integer :course_id

      t.timestamps
    end
  end
end
