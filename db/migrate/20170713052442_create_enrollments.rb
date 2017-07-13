class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :school_class, index: true
      t.references :student, index: true
      t.date :enrolled_at

      t.timestamps null: false
    end
    add_foreign_key :enrollments, :school_classes
    add_foreign_key :enrollments, :students
  end
end
