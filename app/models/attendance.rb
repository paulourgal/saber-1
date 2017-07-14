class Attendance < ActiveRecord::Base
  belongs_to :enrollment
  belongs_to :course

  enum :status => [:absent, :present]
end
