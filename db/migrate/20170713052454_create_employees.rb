class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :cpf
      t.string :email
      t.string :phone
      t.text :address

      t.timestamps null: false
    end
    add_index :employees, :cpf, unique: true
  end
end
