class GroupsController < ApplicationController
  # skip_before_action :authenticate_user_from_token

  def index
    groups = Group.all
    render json: groups.as_json, status: :ok
  end

  def create
    group = Group.new(group_params)
    if group.valid? && group.save
      render json: {message: 'Successfully created group.'}, status: :created
    else
      render json: { errors: group.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def group_params
    params.require(:group).permit(:name, :authentication_code)
  end

end
