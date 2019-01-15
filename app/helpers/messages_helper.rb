module MessagesHelper
  
  def current_user #only fires one sql request
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
