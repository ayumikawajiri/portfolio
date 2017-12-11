class Information < ApplicationRecord
  belongs_to :user

  enum category: { visa: 0, tax: 10, life: 20, job: 30, other: 200 }

  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true

end
