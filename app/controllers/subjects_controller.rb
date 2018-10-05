class SubjectsController < ApplicationController
  def index
    subjects = @current_group.subjects
    render json: subjects.as_json, status: :ok
  end

  def create
    subject = Subject.new(subject_params)
    subject.group = @current_group
    if subject.valid? && subject.save
      render json: subject.as_json, status: :created
    else
      render json: { errors: subject.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end
end
