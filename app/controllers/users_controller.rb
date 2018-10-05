class UsersController < ApplicationController

	# skip_before_action :verify_authenticity_token
	before_action :set_user, only: [:show, :update, :destroy]

	def index
		@users = User.all
		render json: @users, status: :ok
	end

	def show
		@user = User.find(params[:id])
		render json: @user, status: :ok
	end

	def create
		user = User.new(request_params)
		if params[:authentication_code] != 'MY_TOKEN'
			render json: { errors: ['Invalid authentication token. Please contact Prof. Sook Liew'] }, status: :unprocessable_entity
			return
		end
		if user.valid? && user.save
			render json: { user: user }, status: :created
		else
			render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def update
		@user.update(request_params)

		if @user.valid?
			render json: { user: @user}, status: :ok
		else
			render json: { errors: @user.errors }, status: :unprocessable_entity
		end
	end

	private

	def request_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :group, :designation)
	end

	def set_user
		@user = User.find_by_id(params[:id] || params[:user_id])

		render json: { errors: ['User with the given id does not exist']  }, status: :not_found if @user.nil?
	end
end
