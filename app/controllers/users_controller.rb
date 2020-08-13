class UsersController < ApplicationController 
  get '/users/login' do
    erb :"users/login"
  end

  post '/users/login' do
    @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password]) 
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
      else
        erb :"users/invalid_login"
      end
  end
 
  get '/users/new' do
    erb :"users/new" 
  end

  post '/users' do
    @user = User.create(params)
      if @user != nil 
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
      else
        erb :"users/invalid_new"
      end
  end

  get '/users/:id' do
    erb :"users/home"
  end

  get '/users/:id/edit' do
    erb :"users/edit"    
  end

  patch '/users/:id' do
    #binding.pry
  end

  get '/' do
    erb :main
  end
  
  get '/logout' do
    logout!
  end  

end
