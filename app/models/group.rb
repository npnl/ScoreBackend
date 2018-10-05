class Group < ApplicationRecord
  has_many :users
  has_many :subjects
  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
