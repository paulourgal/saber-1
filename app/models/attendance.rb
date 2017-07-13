class Attendance < ActiveRecord::Base
  belongs_to :enrollment
  belongs_to :course
end
