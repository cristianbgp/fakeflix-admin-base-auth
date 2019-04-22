class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :providers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook github instagram]

  def self.from_omniauth(auth)
    if auth.info.email == nil && auth.provider == "instagram"
      auth.info.email = auth.info.nickname + "@codeable.com"
    end
    user = where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
    provider = Provider.find_or_create_by(name: auth.provider, uid: auth.uid, user_id: user.id)
    user
  end

  def regular?
    self.role == "regular"
  end

  def admin?
    self.role == "admin"
  end
end
