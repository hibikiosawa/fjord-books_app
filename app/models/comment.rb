# frozen_string_literal: true

class Comment < ApplicationRecord
  has_one_attached :avatar
end
