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
      if !row.save
        row.valid?
        render json: { errors: row.errors.full_messages }, status: :unprocessable_entity
      end
    end
    render json: {message: 'Successfully created records'}, status: :created
  end

  private

  def set_subject_and_date
    @subject = Subject.where(name: params[:subject_name], group: @current_group).first_or_create
    @date = params[:assessment_date]
    render json: { errors: ['Unable to find or create this given subject']  }, status: :not_found if @subject.nil?
  end

  def wmft_row_params(row_params)
    row_params.permit(:task, :time, :fas_score, :arm_type, :item_no)
  end
end
