class BarthelFormController < ApplicationController
  before_action :set_subject_and_date, only: [:create]

  def index
    @barthel_form_rows = BarthelFormRow.all
    render json: @barthel_form_rows, status: :ok
  end

  def create
    params['barthel_form_rows'].each do |barthel_row|
      allowed_row_params = barthel_row_params(barthel_row)
      row = BarthelFormRow.new(allowed_row_params)
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
    @results = BarthelFormRow.where(assessment_id: params[:id])
    respond_to do |format|
      format.html
      format.csv { send_data @results.to_csv, {filename: 'barthel.csv', type:'text/csv'} }
    end
  end

  private

  def mark_assessment
    if !@subject.nil?
      Assessment.find_or_initialize_by(:subject => @subject, :date => @date, user: @current_user).update_attributes!(:barthel => true)
      @assessment = Assessment.find_by(:subject => @subject, :date => @date)
    end
  end

  def barthel_row_params(row_params)
    row_params.permit(:activity, :score, :description, :total_score)
  end
end
