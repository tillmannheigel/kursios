class Worksheet < ActiveRecord::Base
    validates :title, presence: true
    belongs_to :course
    has_one :attachment, as: :attachable
    has_many :contributions
end
