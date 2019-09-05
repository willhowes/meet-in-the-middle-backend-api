class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  before_save { email.downcase! }
  has_secure_password
  validates(:name, presence: true, length: { maximum: 50 })
  validates(:email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false })
  validates(:password, presence: true, length: { minimum: 6 })

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def authenticate(password)
    BCrypt::Password.new(password_digest) == password
  end

  def generate_session_key!
   key = BCrypt::Engine.generate_salt.gsub(/[^a-z0-9]/i, '_')
   update(session_key: key)
   key
 end

end
