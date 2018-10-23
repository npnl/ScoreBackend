class WmftFormController < ApplicationController
  before_action :set_subject_and_date, only: [:create]

  def index
    @wmft_form_rows = WmftFormRow.all
    render json: @wmft_form_rows, status: :ok
  end

  def create
    params['wmft_form_rows'].each do |wmft_row|
      allowed_row_params = wmft_row_params(wmft_row)
      row = WmftFormRow.new(allowed_row_params)
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
    @results = WmftFormRow.where(assessment_id: params[:id])
    respond_to do |format|
      format.html
      format.csv { send_data @results.to_csv, {filename: 'wmft.csv', type:'text/csv'} }
    end
  end

  private

  def mark_assessment
    if !@subject.nil?
      Assessment.find_or_initialize_by(:subject => @subject, :date => @date, user: @current_user).update_attributes!(:wmft => true)
      @assessment = Assessment.find_by(:subject => @subject, :date => @date)
    end
  end

  def wmft_row_params(row_params)
    row_params.permit(:task, :time, :fas_score, :arm_type, :item_no)
  end
end
