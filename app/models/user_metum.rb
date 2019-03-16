class UserMetum < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :meta_key, scope: :user_id
end
