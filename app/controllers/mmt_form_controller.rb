class MmtFormController < ApplicationController
  before_action :set_subject_and_date, only: [:create]

  def index
    @mmt_form_rows = MmtFormRow.all
    render json: @mmt_form_rows, status: :ok
  end

  def create
    params['mmt_form_rows'].each do |mmt_row|
      allowed_row_params = mmt_row_params(mmt_row)
      row = MmtFormRow.new(allowed_row_params)
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
    @results = MmtFormRow.where(assessment_id: params[:id])
    respond_to do |format|
      format.html
      format.csv { send_data @results.to_csv, {filename: 'mmt.csv', type:'text/csv'} }
    end
  end

  private

  def mark_assessment
    if !@subject.nil?
      @assessment = Assessment.find_or_initialize_by(:subject => @subject, :date => @date, user: @current_user, mmt: false)
      @assessment.update_attributes!(mmt: true)
    end
  end

  def mmt_row_params(row_params)
    row_params.permit(:muscle_name, :mmt_score, :rom_score)
  end
end
