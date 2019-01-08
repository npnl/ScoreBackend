class MalFormController < ApplicationController
  before_action :set_subject_and_date, only: [:create]

  def index
    @mal_form_rows = MalFormRow.all
    render json: @mal_form_rows, status: :ok
  end

  def create
    params['mal_form_rows'].each do |nihss_row|
      allowed_row_params = fma_row_params(nihss_row)
      row = MalFormRow.new(allowed_row_params)
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
    @results = MalFormRow.where(assessment_id: params[:id])
    respond_to do |format|
      format.html
      format.csv { send_data @results.to_csv, {filename: 'mal.csv', type:'text/csv'} }
    end
  end

  private

  def mark_assessment
    if !@subject.nil?
      @assessment = Assessment.find_or_initialize_by(:subject => @subject, :date => @date, user: @current_user, mal: false)
      @assessment.update_attributes!(mal: true)
    end
  end

  def fma_row_params(row_params)
    row_params.permit(:activity_description, :amount_scale, :how_well_scale, :if_not_why, :comments)
  end
end
