class Contribution < ActiveRecord::Base
  has_many :attachments, as: :attachable
  belongs_to :group
  belongs_to :worksheet
end
