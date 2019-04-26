class UsersController < ApplicationController

    get '/users/home' do
      @ny_times_list = Book.all
      erb :'/users/home'
    end
    
    get '/users/:id' do 
      @user = User.find_by_id(params[:id])
      erb :'users/#{@user.id}'
    end

    get '/users/:id/edit' do
      @user = User.find_by(id: params[:id])
      erb :'/users/edit'
    end

    patch '/users/:id' do 
      User.update(username: params[:username], email: params[:email], password: params[:password])
      @user = User.find_by(id: params[:id])
        redirect "users/home"
    end
end