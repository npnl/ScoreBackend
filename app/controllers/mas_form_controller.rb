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

  def mas_row_params(row_params)
    row_params.permit(:muscle_name, :score)
  end
end
