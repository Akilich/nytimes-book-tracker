class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET'), :expire_after => 600
  end

  get '/' do
    erb :home
  end

  get '/signup' do
		erb :'/signup'
  end
  
  post '/signup' do
    if params[:username].empty? || params[:password].empty? 
      redirect '/signup'
    else
    User.create(username: params[:username], email: params[:email], password: params[:password])
      redirect '/login'
    end
  end

  get '/login' do
		erb :'/login'
	end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
      redirect '/users/home'
    else
      flash.message = 'Invalid email/password combination'
      redirect '/login' 
    end
  end
  
  get '/logout' do
    session.clear
    redirect '/'
    erb :home
  end

  helpers do
    def flash
      @flash ||= FlashMessage.new(session)
    end

		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end
end