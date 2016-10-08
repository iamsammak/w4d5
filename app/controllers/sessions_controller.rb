class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credential(
                      session_params[:username],
                      session_params[:password])
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def destroy
    logout(current_user)
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:user).permit(:username, :password)
  end
end
