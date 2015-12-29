class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
  end
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :role_id)
  end
end
