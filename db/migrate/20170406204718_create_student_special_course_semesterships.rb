class CreateStudentSpecialCourseSemesterships < ActiveRecord::Migration[5.0]
  def change
    create_table :student_special_course_semesterships do |t|
      t.integer :student_id
      t.integer :special_course_id
      t.integer :semester_id
      t.integer :credit

      t.timestamps
    end
  end
end
