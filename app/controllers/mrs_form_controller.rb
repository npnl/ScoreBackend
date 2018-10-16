class MrsFormController < ApplicationController
  before_action :set_subject_and_date, only: [:create]

  def index
    @mrs_form_rows = MrsFormRow.all
    render json: @mrs_form_rows, status: :ok
  end

  def create
    params['mrs_form_rows'].each do |mrs_row|
      allowed_row_params = mrs_row_params(mrs_row)
      row = MrsFormRow.new(allowed_row_params)
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
      Assessment.find_or_initialize_by(:subject => @subject, :date => @date).update_attributes!(:mrs => true)
      @assessment = Assessment.find_by(:subject => @subject, :date => @date)
    end
  end

  def mrs_row_params(row_params)
    row_params.permit(:score)
  end
end
