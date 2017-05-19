class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true
  
  has_many :questions
  has_many :comments
  has_many :answers
  has_many :votes

  has_secure_password
end
