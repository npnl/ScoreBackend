class NihssFormController < ApplicationController
  before_action :set_subject_and_date, only: [:create]

  def index
    @nihss_form_rows = NihssFormRow.all
    render json: @nihss_form_rows, status: :ok
  end

  def create
    params['nihss_form_rows'].each do |nihss_row|
      allowed_row_params = nihss_row_params(nihss_row)
      row = NihssFormRow.new(allowed_row_params)
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
    @results = NihssFormRow.where(assessment_id: params[:id])
    respond_to do |format|
      format.html
      format.csv { send_data @results.to_csv, {filename: 'nihss.csv', type:'text/csv'} }
    end
  end

  private

  def mark_assessment
    if !@subject.nil?
      Assessment.find_or_initialize_by(:subject => @subject, :date => @date, user: @current_user).update_attributes!(:nihss => true)
      @assessment = Assessment.find_by(:subject => @subject, :date => @date)
    end
  end

  def nihss_row_params(row_params)
    row_params.permit(:domain, :specific, :fas_score, :item_no, :loc_total, :motor_total, :nihss_total, :comment)
  end
end
