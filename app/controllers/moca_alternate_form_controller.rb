class MocaAlternateFormController < ApplicationController
  before_action :set_subject_and_date, only: [:create]

  def index
    @moca_alternate_form_rows = MocaAlternateFormRow.all
    render json: @moca_alternate_form_rows, status: :ok
  end

  def create
    row = MocaAlternateFormRow.new(moca_alternate_row_params(params))
    row.subject = @subject
    row.date = @date
    row.assessment = @assessment
    if !row.save
      row.valid?
      render json: { errors: row.errors.full_messages }, status: :unprocessable_entity; return
    end
    render json: {message: 'Successfully created records'}, status: :created
  end

  def download_data
    @results = MocaAlternateFormRow.where(assessment_id: params[:id])
    respond_to do |format|
      format.html
      format.csv { send_data @results.to_csv, {filename: 'moca.csv', type:'text/csv'} }
    end
  end

  private

  def mark_assessment
    if !@subject.nil?
      @assessment = Assessment.find_or_initialize_by(:subject => @subject, :date => @date, user: @current_user, moca_alternate: false)
      @assessment.update_attributes!(moca_alternate: true)
    end
  end

  def moca_alternate_row_params(row_params)
    row_params.permit(:visuospatial_executive, :naming, :attention_1, :attention_2, :attention_3, :language_1, :language_2, :abstraction, :delayed_recall, :orientation, :edu_less_than_12_yrs, :total_score)
  end
end
