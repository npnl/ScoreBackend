class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  default_scope -> { where(deleted_at: nil) }
  scope :only_deleted, -> { unscope(where: :deleted_at).where.not(deleted_at: nil) }
  scope :with_deleted, -> { unscope(where: :deleted_at) }

  alias_method :really_destroy!, :destroy

  def destroy
    update(deleted_at: Time.current)
  end

  def self.to_csv
    extracted_columns = column_names - %w(id subject_id created_at updated_at assessment_id deleted_at)
    all_columns = ['subject_name'] + extracted_columns + ['Assessed by']
    all_columns = all_columns.map(&:upcase)
    CSV.generate do |csv|
      csv << all_columns
      all.each do |result|
        csv << [result.subject.name] + result.attributes.values_at(*extracted_columns) + [result.assessment.user.name]
      end
    end
  end
end
