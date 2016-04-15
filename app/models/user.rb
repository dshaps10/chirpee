require 'bcrypt'

class User < ActiveRecord::Base

	include BCrypt

	has_many :tweets
	validates :last_name, :first_name, :handle, :email, :city, :state, :country, :password_hash, presence: true
	validates :email, :handle, uniqueness: true

	has_many :follower_relations, foreign_key: "follower_id", class_name: "Relation"
	has_many :followers, through: :follower_relations

	has_many :followee_relations, foreign_key: "followee_id", class_name: "Relation"
	has_many :followees, through: :followee_relations

	# For one to many self referentials not Many to many
	# has_many :followers, class_name: "User", foreign_key: "followee_id"
	# belongs_to :followee, class_name: "User"


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
