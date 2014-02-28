class Contribution < ActiveRecord::Base
  has_one :attachment
  belongs_to :group
  belongs_to :worksheet
end
