# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :recipes
  has_many :favorites, dependent: :destroy
  has_many :favorite_recipes, through: :favorites, source: :recipe

  def favorite?(recipe)
    favorite_recipes.include?(recipe)
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.find_by(email: data['email']) || User.find_or_initialize_by(provider: access_token.provider, uid: access_token.uid)

    user.email = data['email']
    user.name = data['name']
    user.provider = access_token.provider
    user.uid = access_token.uid
    user.password ||= Devise.friendly_token[0, 20]

    Rails.logger.debug "🛠 User Validation Errors: #{user.errors.full_messages}" unless user.valid?

    user.save!
    user
  end
end
