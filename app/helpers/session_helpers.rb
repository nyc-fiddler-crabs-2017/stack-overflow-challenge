helpers do
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_user
    redirect '/login' unless logged_in?
  end

  def require_owner(input_id)
    input_id == current_user.id
  end
end
