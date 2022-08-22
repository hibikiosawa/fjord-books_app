# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  has_many :followfollowers, class_name: 'Followfollower', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :follower
  has_many :reverse_of_followfollowers, class_name: 'Followfollower', foreign_key: 'followed_id', dependent: :destroy, inverse_of: :followed

  has_many :followings, through: :followfollowers, source: :followed
  has_many :followers, through: :reverse_of_followfollowers, source: :follower

  def follow(user_id)
    followfollowers.create(followed_id: user_id)
  end

  def unfollow(user_id)
    followfollowers.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
