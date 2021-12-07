class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },
                                    format: { with: EMAIL_REGEX },
                                    uniqueness: { case_sensetive: false }
  has_secure_password
end
