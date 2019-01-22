class Assessment < ApplicationRecord
  has_many :armtest_form_rows
  has_many :barthel_form_rows
  has_many :fma_form_rows
  has_many :mas_form_rows
  has_many :mmt_form_rows
  has_many :mrs_form_rows
  has_many :nihss_form_rows
  has_many :sis_form_rows
  has_many :wmft_form_rows
  has_many :mal_form_rows
  has_many :moca_alternate_form_rows

  belongs_to :subject
  belongs_to :user

  attr_accessor :assessed_by

  def assessed_by
    self.user.name
  end

  def as_json(options = { })
    h = super(options)
    h[:assessed_by] = assessed_by
    h
  end
end
