# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  has_many :followfollower, class_name: "Followfollower", foreign_key: "follower_id", dependent: :destroy 
  has_many :reverse_of_followfollower, class_name: "Followfollower", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :followfollower, source: :followed
  has_many :followers, through: :reverse_of_followfollower, source: :follower

  # フォローしたときの処理
  def follow(user_id)
    followfollower.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    followfollower.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followfollower.include?(user)
  end

end
