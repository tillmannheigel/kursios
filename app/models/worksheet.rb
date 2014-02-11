class Worksheet < ActiveRecord::Base
    validates :title, presence: true
end
