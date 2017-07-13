class CreateTeachings < ActiveRecord::Migration
  def change
    create_table :teachings do |t|
      t.references :school_class, index: true
      t.references :employee, index: true
      t.references :course, index: true

      t.timestamps null: false
    end
    add_foreign_key :teachings, :school_classes
    add_foreign_key :teachings, :employees
    add_foreign_key :teachings, :courses
  end
end
