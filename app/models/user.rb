require 'bcrypt'

class User < ActiveRecord::Base
	
	include BCrypt

	has_many :tweets
	validates :last_name, :first_name, :handle, :email, :city, :state, :country, :password_hash, presence: true
	validates :email, :handle, uniqueness: true

  def password
    @password ||= Password.new(password_hash) if password_hash.present?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate?(password)
  	password == self.password_hash
  end

end
