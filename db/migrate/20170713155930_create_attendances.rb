class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.date :attendance_date
      t.text :obs
      t.integer :status
      t.references :enrollment, index: true
      t.references :course, index: true

      t.timestamps null: false
    end
    add_foreign_key :attendances, :enrollments
    add_foreign_key :attendances, :courses
  end
end
