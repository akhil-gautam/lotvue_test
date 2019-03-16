class UsersController < ApplicationController

  def new
    @user = User.new
    @roles = Role.where(hidden: false)
  end

  def create
    user = User.new(user_params)
    if user.save
      role_ids = params[:user][:role_ids]
      role_ids.each do|role_id|
        UserRole.create(user_id: user.id, role_id: role_id)
      end
    end
    redirect_to users_path
  rescue Exception => e
    pretty_response({success: false, message: e.message}, :bad_request)
  end

  def index
    @users = User
            .includes(:roles)
            .select('users.id, users.first_name, users.last_name')
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, 
      user_meta_attributes: [:meta_key, :meta_value])
  end

end
