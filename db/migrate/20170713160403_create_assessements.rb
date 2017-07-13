class CreateAssessements < ActiveRecord::Migration
  def change
    create_table :assessements do |t|
      t.integer :quarter
      t.date :assessement_date
      t.integer :type
      t.string :label
      t.integer :grade
      t.references :enrollment, index: true
      t.references :course, index: true

      t.timestamps null: false
    end
    add_foreign_key :assessements, :enrollments
    add_foreign_key :assessements, :courses
  end
end
