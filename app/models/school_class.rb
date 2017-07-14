class SchoolClass < ActiveRecord::Base
  belongs_to :school

  has_many :enrollments
  has_many :students, :through => :enrollments

  enum :kind => [:first_years, :last_years]
end
