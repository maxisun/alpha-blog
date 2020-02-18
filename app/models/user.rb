class User < ApplicationRecord
  has_many :articles
  #before_save { self.email = email.downcase } => antes de guardarlo a la base lo va poner todo a minuscula
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end