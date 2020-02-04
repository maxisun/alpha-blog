class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimun: 3, maximun: 50 }
  validates :description, presence: true, length: { minimun: 3, maximun: 10_000_000 }
end