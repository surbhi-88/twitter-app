class UserSerializer < ActiveModelSerializers::Model
  attributes :id, :user_name, :email, :followings, :followers
end