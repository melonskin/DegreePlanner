class AddPackageIdToPackageCourseships < ActiveRecord::Migration[5.0]
  def change
    add_column :package_courseships, :package_id, :integer
  end
end
