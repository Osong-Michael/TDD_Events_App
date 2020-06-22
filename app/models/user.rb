class User < ApplicationRecord
  has_secure_password

  validates :name, :email, presence: true, uniqueness: true 

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
  
end
