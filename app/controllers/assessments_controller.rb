class AssessmentsController < ApplicationController

  def update_comments
    assessment = Assessment.find(comment_params[:assessment_id])
    if assessment.update_attributes!(comments: comment_params[:comments])
      render json: {message: 'Successfully updated the comment'}, status: :accepted
    else
      render json: { errors: ['Unable update the comment']}, status: :unprocessable_entity
    end
  end

  def destroy
    assessment = Assessment.find(delete_params[:assessment_id])
    if assessment.user != @current_user and !@current_user.is_admin
        render json: { errors: ['You do not have permissions to delete this record because someone else created this.']}, status: :unprocessable_entity and return
    end
    case delete_params[:form_type]
      when 'fma'
        rows = FmaFormRow.where(assessment: assessment)
      when 'arm'
        rows = ArmtestFormRow.where(assessment: assessment)
      when 'nihss'
        rows = NihssFormRow.where(assessment: assessment)
      when 'wmft'
        rows = WmftFormRow.where(assessment: assessment)
      when 'sis'
        rows = SisFormRow.where(assessment: assessment)
      when 'mrs'
        rows = MrsFormRow.where(assessment: assessment)
      when 'mas'
        rows = MasFormRow.where(assessment: assessment)
      when 'mmt'
        rows = MmtFormRow.where(assessment: assessment)
      when 'barthel'
        rows = BarthelFormRow.where(assessment: assessment)
      else
        render json: { errors: 'Wrong form type passes to delete'}, status: :unprocessable_entity and return
    end
    begin
      ApplicationRecord.transaction do
        rows.destroy_all
        assessment.update_attributes!(delete_params[:form_type] => false)
        empty_assessments = Assessment.where(:nihss => false, :fma => false, :wmft => false, :sis => false, :mrs => false, :mas => false, :mmt => false, :barthel => false, :arm => false)
        empty_assessments.destroy_all
      end
    rescue ActiveRecord::RecordInvalid
      render json: { errors: ['Unable to delete the specified record']}, status: :unprocessable_entity and return
    end
  render json: {message: 'Successfully deleted records'}, status: :accepted
end

  private

  def comment_params
    params.require(:assessment).permit(:assessment_id, :comments)
  end

  def delete_params
    params.require(:delete_assessment).permit(:assessment_id, :form_type)
  end
end
