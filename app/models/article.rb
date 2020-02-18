class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3, maximun: 50 }
  validates :description, presence: true, length: { minimum: 3, maximun: 10_000_000 }
  validates :user_id, presence: true
end