module UsersHelper
  def display_roles(user)
    user.roles.pluck(:name).join(', ')
  end
end
