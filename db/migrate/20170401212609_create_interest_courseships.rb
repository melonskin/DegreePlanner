class CreateInterestCourseships < ActiveRecord::Migration[5.0]
  def change
    create_table :interest_courseships do |t|
      t.integer :interest_id
      t.integer :course_id

      t.timestamps
    end
  end
end
