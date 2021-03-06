class ArmtestFormController < ApplicationController
  before_action :set_subject_and_date, only: [:create]

  def index
    @armtest_form_rows = ArmtestFormRow.all
    render json: @armtest_form_rows, status: :ok
  end

  def create
    params['armtest_form_rows'].each do |armtest_row|
      allowed_row_params = armtest_row_params(armtest_row)
      row = ArmtestFormRow.new(allowed_row_params)
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
    @results = ArmtestFormRow.where(assessment_id: params[:id])
    respond_to do |format|
      format.html
      format.csv { send_data @results.to_csv, {filename: 'armtest.csv', type:'text/csv'} }
    end
  end

  private

  def mark_assessment
    if !@subject.nil?
      @assessment = Assessment.find_or_initialize_by(:subject => @subject, :date => @date, user: @current_user, arm: false)
      @assessment.update_attributes!(arm: true)
    end
  end

  def armtest_row_params(row_params)
    row_params.permit(:arm_type, :activity, :score)
  end
end
