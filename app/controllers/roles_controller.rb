class RolesController < ApplicationController
  def new
    @role = Role.new
  end

  def create
    @role = Role.create(role_params)
    redirect_to roles_path
  end

  def index
    @roles = Role.all.order(:name)
  end

  def hide
    Role.where(id: params[:checked_role_ids]).update_all(hidden: true)
    Role.where.not(id: params[:checked_role_ids]).update_all(hidden: false)
    pretty_response({success: true}, :ok)
  rescue Exception => e
    pretty_response({success: false, message: e.message}, :bad_request)
  end

  private

  def role_params
    params.require(:role).permit(:name, :hidden)
  end
end
