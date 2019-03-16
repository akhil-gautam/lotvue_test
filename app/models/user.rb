class User < ActiveRecord::Base
  has_many :images
  has_many :user_meta, inverse_of: :user

  has_many :user_roles
  has_many :roles, through: :user_roles

  validates :email, uniqueness: true

  accepts_nested_attributes_for :user_meta
end
