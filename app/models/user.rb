class User < ApplicationRecord
	belongs_to :group
  has_many :assessments

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	before_save { self.email = email.downcase }

	validates :name, presence: true
	validates :group, presence: true
	validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, on: :create


  def is_admin
		return self.admin
	end

end