class CreatePackageCourseships < ActiveRecord::Migration[5.0]
  def change
    create_table :package_courseships do |t|

      t.timestamps
    end
  end
end
