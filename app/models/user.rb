class User < ApplicationRecord
  has_secure_password
  has_secure_token
  has_many :questions
  has_many :answers

  validates_uniqueness_of :username
  validates_presence_of :username
end
