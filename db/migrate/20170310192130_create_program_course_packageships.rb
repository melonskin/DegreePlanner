class CreateProgramCoursePackageships < ActiveRecord::Migration[5.0]
  def change
    create_table :program_course_packageships do |t|
      t.integer :program_id
      t.integer :course_id
      t.integer :package_id

      t.timestamps
    end
  end
end
