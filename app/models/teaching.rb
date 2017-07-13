class Teaching < ActiveRecord::Base
  belongs_to :school_class
  belongs_to :employee
  belongs_to :course
end
