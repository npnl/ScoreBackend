class SisFormController < ApplicationController
  before_action :set_subject_and_date, only: [:create]

  def index
    @sis_form_rows = SisFormRow.all
    render json: @sis_form_rows, status: :ok
  end

  def create
    params['sis_form_rows'].each do |sis_row|
      allowed_row_params = sis_row_params(sis_row)
      row = SisFormRow.new(allowed_row_params)
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

  def download_data
    @results = SisFormRow.where(assessment_id: params[:id])
    respond_to do |format|
      format.html
      format.csv { send_data @results.to_csv, {filename: 'sis.csv', type:'text/csv'} }
    end
  end

  private

  def mark_assessment
    if !@subject.nil?
      @assessment = Assessment.find_or_initialize_by(:subject => @subject, :date => @date, user: @current_user, sis: false)
      @assessment.update_attributes!(sis: true)
    end
  end

  def sis_row_params(row_params)
    row_params.permit(:question_id, :selected_option)
  end
end
