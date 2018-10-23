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

  def all_subject_info
    output = prepare_listing
    render json: output, status: :ok
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end

  def prepare_listing
    output = []
    @subjects = Subject.where(group_id: @current_group.id)
    @subjects.each do |subject|
      assessments = Assessment.where(subject: subject).select(:id, :date, :nihss, :fma, :wmft, :sis, :mrs, :mas, :mmt, :barthel, :arm, :user_id)
      if !assessments.empty?
        record = {subject_name: subject.name}
        record[:assessments] = assessments
        output.push(record)
      end
    end
    output
  end
end
