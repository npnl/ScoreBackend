class BarthelFormController < ApplicationController
  before_action :set_subject_and_date, only: [:create]

  def index
    @barthel_form_rows = BarthelFormRow.all
    render json: @barthel_form_rows, status: :ok
  end

  def create
    params['barthel_form_rows'].each do |armtest_row|
      allowed_row_params = barthel_row_params(armtest_row)
      row = BarthelFormRow.new(allowed_row_params)
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

  def barthel_row_params(row_params)
    row_params.permit(:task, :time, :fas_score, :arm_type, :item_no)
  end
end
