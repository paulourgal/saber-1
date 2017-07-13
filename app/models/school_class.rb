class SchoolClass < ActiveRecord::Base
  belongs_to :school

  enum :kind => [:first_years, :last_years]
end
