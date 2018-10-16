class FmaFormController < ApplicationController
  before_action :set_subject_and_date, only: [:create]

  def index
    @fma_form_rows = FmaFormRow.all
    render json: @fma_form_rows, status: :ok
  end

  def create
    params['fma_form_rows'].each do |nihss_row|
      allowed_row_params = fma_row_params(nihss_row)
      row = FmaFormRow.new(allowed_row_params)
      row.subject = @subject
      row.date = @date
      row.assessment = @assessment
      if !row.save
        row.valid?
        render json: { errors: row.errors.full_messages }, status: :unprocessable_entity
      end
    end
    render json: {message: 'Successfully created records'}, status: :created
  end

  private

  def mark_assessment
    if !@subject.nil?
      Assessment.find_or_initialize_by(:subject => @subject, :date => @date).update_attributes!(:fma => true)
      @assessment = Assessment.find_by(:subject => @subject, :date => @date)
    end
  end

  def fma_row_params(row_params)
    row_params.permit(:domain, :specific, :fas_score, :item_no)
  end
end
