class RemovePrerequisiteFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :prerequisite, :text
  end
end
