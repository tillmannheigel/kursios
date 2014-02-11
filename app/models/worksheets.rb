class Worksheets < ActiveRecord::Base
      validates :title, presence: true
end
