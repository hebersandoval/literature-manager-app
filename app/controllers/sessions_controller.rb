class SessionsController < ApplicationController
  def new
  end

  def create
    # finds the user in the db using the submitted email address
    user = User.find_by(email: params[:session][:email].downcase)
    # determine if the resulting user's email and password are valid (exist in the db)
    if user && user.authenticate(params[:session][:password])
      # log the user in and redirect_to the user's show page
      log_in user
      flash[:success] = "Welcome back!"
      redirect_to user
    else
      # since the Session isn't an AR model, use a message in a flash
      flash.now[:danger] = "Invalid email/password combination."
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
