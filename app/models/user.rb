class User < ActiveRecord::Base
  has_secure_password
  attr_accessor :remember_token

  validates :name, presence: true, length: {minimum: 6}
  validates :email, presence:true, length: {maximum: 255},
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i} 

  before_save :downcase_email

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
