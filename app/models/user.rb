class User < ActiveRecord::Base
	has_many :tweets
	validates :last_name, :first_name, :handle, :email, :city, :state, :country, :password_hash, presence: true
	validates :email, :handle, uniqueness: true
end
