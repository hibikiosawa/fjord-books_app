class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable

  validates :body, presence:true
  validates :title, presence:true
end
