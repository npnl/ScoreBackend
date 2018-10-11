class Subject < ApplicationRecord
  belongs_to :group
  has_many :nihss_forms

  validates :name, presence: true, :uniqueness => {:scope => :group}
  validates :group, presence: true
end
