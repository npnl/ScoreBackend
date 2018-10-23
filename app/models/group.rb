class Group < ApplicationRecord
  has_many :users
  has_many :subjects
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def user_count
    self.users.count
  end

  def subject_count
    self.subjects.count
  end

  def assessment_count
    count = 0
    self.subjects.each do |subject|
      count += subject.assessments.count
    end
    count
  end

  def as_json(options = { })
    h = super(options)
    h[:user_count] = user_count
    h[:subject_count] = subject_count
    h[:assessment_count] = assessment_count
    h
  end
end
