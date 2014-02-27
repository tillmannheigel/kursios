class Worksheet < ActiveRecord::Base
    validates :title, presence: true
    belongs_to :course
    has_one :attachment
end
