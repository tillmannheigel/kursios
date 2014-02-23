class Course < ActiveRecord::Base
  
  belongs_to :admin
  has_and_belongs_to_many :students
end
