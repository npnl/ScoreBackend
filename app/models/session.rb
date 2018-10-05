class Session < ApplicationRecord
  belongs_to :user
  validates :access_token, presence: true, uniqueness: true

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # def authenticated?(client_token)
  #   BCrypt::Password.new(access_token).is_password?(client_token)
  # end
end
