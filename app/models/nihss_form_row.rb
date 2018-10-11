class NihssFormRow < ApplicationRecord
  belongs_to :subject
  # validates :subject, presence: true, :uniqueness => {:scope => :date}
end
