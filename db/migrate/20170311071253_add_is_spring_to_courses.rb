class AddIsSpringToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :is_spring, :string
  end
end
