class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :groups
  has_many :contributions
  
  def all_worksheets
    worksheets = []
    self.courses.each do |c|
      c.worksheets.each do |w|
      worksheets << w
      end
    end
    return worksheets
  end
  
    def first_worksheets(how_much)
    return self.all_worksheets
  end
end
