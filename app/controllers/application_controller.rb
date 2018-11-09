# rake db:create_migration NAME=create_require_relative '../../config/environment'
# class ApplicationController < Sinatra::Base
#   configure do
#     set :views, Proc.new { File.join(root, "../views/") }
#     enable :sessions unless test?
#     set :session_secret, "secret"
#   end
  


class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
  end
  
  
  

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    
    if @user && @user.password == params[:password]
      session[:id] = @user.id
      redirect '/account'
    else 
      erb :error
    end
  end

  get '/account' do

  end

  get '/logout' do
    session.clear
    erb :index
  end


end

