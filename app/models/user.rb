class User < ActiveRecord::Base
  has_many :images
  has_many :user_meta

  has_many :user_roles
  has_many :roles, through: :user_roles
end
