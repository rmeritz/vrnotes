class SessionsController < ApplicationController
  before_action :set_user, only: :create

  def new
    @user = User.new
  end

  def create
    if @user.valid?
      redirect_to user_annotations_path(@user)
    else
      redirect_to new_session_path, alert: "Could not log you in. Please try again."
    end
  end

  private

  def session_params
    params.require(:user).permit(:username)
  end

  def set_user
    @user = User.new session_params
  end
end
