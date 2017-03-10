class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password
      t.string :f1status
      t.integer :program_id

      t.timestamps
    end
  end
end
