class AddSomeColumnToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :dep_hour, :integer
    add_column :programs, :graded_grad_hour, :integer
    add_column :programs, :ug_hour_min, :integer
    add_column :programs, :ug_hour_max, :integer

    add_column :programs, :non_dep_hour_min, :integer
    add_column :programs, :non_dep_hour_max, :integer
    add_column :programs, :seminar_hour_min, :integer
    add_column :programs, :seminar_hour_max, :integer
    add_column :programs, :direct_study_hour_min, :integer
    add_column :programs, :direct_study_hour_max, :integer
    add_column :programs, :total_hour, :integer
    add_column :programs, :total_hour_prior, :integer
    add_column :programs, :research_hour_min, :integer
    add_column :programs, :research_hour_max, :integer
    add_column :programs, :joint_hour_min, :integer
    add_column :programs, :joint_hour_max, :integer
    add_column :programs, :elective_hour_min, :integer
    add_column :programs, :elective_hour_max, :integer
    add_column :programs, :joint_dep, :string
  end
end
