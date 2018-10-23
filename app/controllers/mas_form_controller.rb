class MasFormController < ApplicationController
  before_action :set_subject_and_date, only: [:create]

  def index
    @mas_form_rows = MasFormRow.all
    render json: @mas_form_rows, status: :ok
  end

  def create
    params['mas_form_rows'].each do |mas_row|
      allowed_row_params = mas_row_params(mas_row)
      row = MasFormRow.new(allowed_row_params)
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
    @results = MasFormRow.where(assessment_id: params[:id])
    respond_to do |format|
      format.html
      format.csv { send_data @results.to_csv, {filename: 'mas.csv', type:'text/csv'} }
    end
  end

  private

  def mark_assessment
    if !@subject.nil?
      Assessment.find_or_initialize_by(:subject => @subject, :date => @date, user: @current_user).update_attributes!(:mas => true)
      @assessment = Assessment.find_by(:subject => @subject, :date => @date)
    end
  end

  def mas_row_params(row_params)
    row_params.permit(:muscle_name, :score)
  end
end
