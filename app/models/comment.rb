class Comment < ApplicationRecord
  belongs_to :classified

  validates :nickname, presence: true
  validates :message, presence: true
end
