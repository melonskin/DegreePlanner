class AddCourseIdToPackageCourseships < ActiveRecord::Migration[5.0]
  def change
    add_column :package_courseships, :course_id, :integer
  end
end
