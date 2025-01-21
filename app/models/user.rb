class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :recipes



  def self.from_omniauth(access_token)
    data = access_token.info
    User.find_or_create_by(email: data['email']) do |user|
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
