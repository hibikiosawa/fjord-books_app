# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :Follow_folloer, class_name: "Follow_follower", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_follow_follower, class_name: "Follow_follower", foreign_key: "followed_id", dependent: :destroy

  has_many :followings, through: :Follow_follower, source: :followed
  has_many :followers, through: :reverse_of_follow_follower, source: :follower

  def follow(user_id)
    Follow_follower.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    Follow_follower.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    Follow_follower.include?(user)
  end
end
