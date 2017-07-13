class AddCustomFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :role, :integer
    add_column :users, :cpf, :string
    add_index :users, :cpf, :unique => true
  end
end
