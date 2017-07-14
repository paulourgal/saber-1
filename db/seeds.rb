# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Course.create(:name => 'Matemática')

School.create(:name => 'EEEF Euclides Guimarães', :address => 'Rua 13 de agosto, 245, Vila Aparecida, CEP: 13453-342', :phone => '(19) 9123123123', :email => 'escola@example.com')

SchoolClass.create(:school_id => 1, :name => '6o Ano A', :kind => :last_years)

Student.create(:name => 'André',    :address => 'Rua Campos Sales, 454, Centro', :phone => '(19) 9123123123', :email => 'andre@example.com')
Student.create(:name => 'Jéssica',  :address => 'Rua Campos Sales, 454, Centro', :phone => '(19) 9123123123', :email => 'jessica@example.com')
Student.create(:name => 'João',     :address => 'Rua Campos Sales, 454, Centro', :phone => '(19) 9123123123', :email => 'joao@example.com')
Student.create(:name => 'José',     :address => 'Rua Campos Sales, 454, Centro', :phone => '(19) 9123123123', :email => 'jose@example.com')
Student.create(:name => 'Juliana',  :address => 'Rua Campos Sales, 454, Centro', :phone => '(19) 9123123123', :email => 'juliana@example.com')
Student.create(:name => 'Maria',    :address => 'Rua Campos Sales, 454, Centro', :phone => '(19) 9123123123', :email => 'maria@example.com')
Student.create(:name => 'Paula',    :address => 'Rua Campos Sales, 454, Centro', :phone => '(19) 9123123123', :email => 'paula@example.com')
Student.create(:name => 'Pedro',    :address => 'Rua Campos Sales, 454, Centro', :phone => '(19) 9123123123', :email => 'pedro@example.com')
Student.create(:name => 'Roberto',  :address => 'Rua Campos Sales, 454, Centro', :phone => '(19) 9123123123', :email => 'roberto@example.com')
Student.create(:name => 'Sandra',   :address => 'Rua Campos Sales, 454, Centro', :phone => '(19) 9123123123', :email => 'sandra@example.com')

(1..10).each {|s| Enrollment.create(:school_class_id => 1, :student_id => s, :enrolled_at => DateTime.now) }

Enrollment.all.each do |e|
  (Date.today.beginning_of_year..Date.today).each { |d| Attendance.create(:enrollment_id => e.id, :course_id => 1, :attendance_date => d, :status => [0, 1].sample ) unless d.saturday? || d.sunday? }
end

Employee.create(:name => '"Carlos Souza', :cpf => '123456789-00', :email => 'carlos@example.com', :phone => '(19) 98989898', :address => 'Rua Campos Sales, 454, Centro')
User.create(:name => '"Carlos Souza', :role => :teacher, :cpf => '123456789-00', :email => 'carlos@example.com', :password => 'user123', :password_confirmation => 'user123')

Teaching.create(:school_class_id => 1, :employee_id => 1, :course_id => 1)