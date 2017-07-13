class Assessement < ActiveRecord::Base
  belongs_to :enrollment
  belongs_to :course

  enum :type => [:grade, :retake]
end
