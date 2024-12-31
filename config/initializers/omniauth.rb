OmniAuth.config.full_host = Rails.env.production? ? 'https://your-production-url.com' : 'http://localhost:3000'

OmniAuth.config.on_failure = Proc.new do |env|
  SessionsController.action(:failure).call(env)
end

OmniAuth.config.allowed_request_methods = [:post]