class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
