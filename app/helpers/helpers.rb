class Helpers
  
  def current_user(session)
    @user = User.find_by(params[:username], params[:password])
    
    if session[:id] == @user.id
      
  end 
  
  def is_logged_in?
    
  end 
  
end