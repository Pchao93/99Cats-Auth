class User < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token

  attr_reader :password

  has_many :cats

  def reset_session_token
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    actual_pw = BCrypt::Password.new(self.password_digest)
    actual_pw.is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user.nil? || user.is_password?(password)
    nil
  end

  # def self.find_by_credentials(username, password)
  #   user = User.find_by(username: username)
  #   return nil if user.nil?
  #   user.is_password?(password) ? user : nil
  # end



private

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

end
