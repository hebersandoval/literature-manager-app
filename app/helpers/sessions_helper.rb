module SessionsHelper
  def log_in(user)
    # rails method: make temporary cookies using the session method that are automatically ecncrypted
    # and expire automatically on browser close
    session[:user_id] = user.id
  end

  # returns the current logged in user (if any)
  def current_user
    # storing in a instance variable, which hits the db the 1st time but
    # returns the instance variable immediately on subsequents invocations
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # returns true if the user is logged in, failure otherwise
  def logged_in?
    !current_user.nil?
  end

  # logs out the current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
