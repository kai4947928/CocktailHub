# frozen_string_literal: true

OmniAuth.config.full_host = Rails.env.production? ? "https://cocktail-hub-74469733b659.herokuapp.com" : "http://localhost:3000"

OmniAuth.config.on_failure = proc do |env|
  SessionsController.action(:failure).call(env)
end

OmniAuth.config.allowed_request_methods = [:post]
