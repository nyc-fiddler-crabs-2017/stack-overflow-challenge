def current_user
  User.find_by(id: session[:user_id])
end

def logged_in?
  !!session[:user_id]
end

def requires_owner(user)
  session[:user_id] == user.id
end
