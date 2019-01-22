class Subject < ApplicationRecord
  belongs_to :group

  has_many :armtest_form_rows
  has_many :barthel_form_rows
  has_many :fma_form_rows
  has_many :mas_form_rows
  has_many :mmt_form_rows
  has_many :mrs_form_rows
  has_many :nihss_form_rows
  has_many :sis_form_rows
  has_many :wmft_form_rows
  has_many :moca_alternate_form_rows

  has_many :assessments

  validates :name, presence: true, :uniqueness => {:scope => :group}
  validates :group, presence: true
end
