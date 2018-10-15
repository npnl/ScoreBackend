class MrsFormController < ApplicationController
  before_action :set_subject_and_date, only: [:create]

  def index
    @mrs_form_rows = MrsFormRow.all
    render json: @mrs_form_rows, status: :ok
  end

  def create
    params['mrs_form_rows'].each do |mrs_row|
      allowed_row_params = mrs_row_params(mrs_row)
      row = MrsFormRow.new(allowed_row_params)
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

  def mrs_row_params(row_params)
    row_params.permit(:score)
  end
end
