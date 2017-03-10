class CreatePrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :acronym
      t.boolean :is_thesis

      t.timestamps
    end
  end
end
