class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}, unless: :provider
  validates :name, presence: true
  validates :password, presence: true, unless: :provider
  validates :password_confirmation, presence: true, unless: :provider

  default_scope {order('users.created_at ASC')}

  def admin?
    role == "admin"
  end
end
