class ApplicationController < ActionController::Base
  rescue_from Aws::Record::Errors::NotFound, with: :record_not_found

  private

  def authenticate_user!
    @user = User.new(username: params[:user_username])
    redirect_to new_session_path, alert: "User could not be found" unless @user.valid?
  end

  def record_not_found
    render plain: "404 Not Found", status: 404
  end
end
