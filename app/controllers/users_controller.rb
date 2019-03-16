class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    
  end

  def index
    @users = User
            .includes(:roles)
            .select('users.id, users.first_name, users.last_name')
  end

  private

  def user_params
    params.require(:user).permit!
  end

end
