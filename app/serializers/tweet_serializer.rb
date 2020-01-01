class TweetSerializer < ActiveModelSerializers::Model
  attributes :id, :body, :user

  def user
    object.user&.user_name
  end
end