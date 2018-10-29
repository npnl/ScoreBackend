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

  def all_subject_names
    @subjects =  @current_user.is_admin ? Subject.all : Subject.where(group: @current_group)
    output = []
    @subjects.each do |subject|
      assessments = Assessment.where(subject: subject).select(:id, :date, :nihss, :fma, :wmft, :sis, :mrs, :mas, :mmt, :barthel, :arm, :user_id)
      if !assessments.empty?
        record = {subject_name: subject.name}
        record[:assessments] = assessments
        output.push(record)
      end
    end
    render json: output, status: :ok
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end

  def prepare_listing
    output = []
    @subjects =  @current_user.is_admin ? Subject.all : Subject.where(group: @current_group)
    if !@subjects.empty?
      subject_groups = @subjects.group_by { |sub| sub.group.name }
      # return subject_groups
      subject_groups.each do |group_name, subjects|
        group_output = {group_name: group_name}
        group_subjects = []
        subjects.each do |subject|
          puts "The subject name is #{subject[:id]} and name is #{subject[:name]}"
          assessments = Assessment.where(subject_id: subject[:id]).select(:id, :date, :nihss, :fma, :wmft, :sis, :mrs, :mas, :mmt, :barthel, :arm, :user_id)
          if !assessments.empty?
            record = {subject_name: subject[:name]}
            record[:assessments] = assessments
            group_subjects.push(record)
          end
        end
        group_output[:subjects] = group_subjects
        output.push(group_output)
      end

      end
    output
  end
end
