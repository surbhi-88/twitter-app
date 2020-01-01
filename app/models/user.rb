class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :follows, dependent: :destroy

  has_many :followings, through: :follows, source: :followed_user

  def followers
    Follow.where(followed_user_id: id).map(&:user)
  end
end
