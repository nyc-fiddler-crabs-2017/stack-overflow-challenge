get '/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.find_by(username: params[:user][:username])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Email and Password do not match our records."]
    erb :'users/login'
  end
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    status 400
    erb :'users/new'
  end
end

get '/users/:id' do

  @user = User.find_by(id: params[:id])
  erb :'users/show'
end

get '/logout' do
  session.clear
  redirect '/'
end
