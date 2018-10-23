class NihssFormRow < ApplicationRecord
  belongs_to :subject
  belongs_to :assessment
  # validates :subject, presence: true, :uniqueness => {:scope => :date}


end
