Rails.application.config.middleware.use OmniAuth::Builder do  #use middleware created by omniauth for authentication 
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end
