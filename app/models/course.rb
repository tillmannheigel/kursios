class Course < ActiveRecord::Base
  
  belongs_to :tutor
  has_and_belongs_to_many :students
  has_many :worksheets
  
end
