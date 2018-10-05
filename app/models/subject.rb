class Subject < ApplicationRecord
  belongs_to :group
  validates :name, presence: true, :uniqueness => {:scope => :group}
end
