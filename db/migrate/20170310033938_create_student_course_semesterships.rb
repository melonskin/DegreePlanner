class CreateStudentCourseSemesterships < ActiveRecord::Migration[5.0]
  def change
    create_table :student_course_semesterships do |t|
      t.integer :student_id
      t.integer :course_id
      t.integer :semester_id

      t.timestamps
    end
  end
end
