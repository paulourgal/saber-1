class CreateSchoolClasses < ActiveRecord::Migration
  def change
    create_table :school_classes do |t|
      t.references :school, index: true
      t.string :name
      t.integer :kind

      t.timestamps null: false
    end
    add_foreign_key :school_classes, :schools
  end
end
