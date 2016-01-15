class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @users = User.all
    @roles = Role.all.select(:id, :name)
  end

  def create
    authorize! :create, User

    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :role_id)
    end
end
