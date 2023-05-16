class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new; end

  def create
    auth = request.env["omniauth.auth"]
    begin
      if (User.find_by_provider_and_uid(auth["provider"], auth["uid"]))
        @auth_user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
      else
        @auth_user = User.new
        @auth_user.provider = auth["provider"]
        @auth_user.uid = auth["uid"]
        @auth_user.name = auth["info"]["name"]
        @auth_user.email = auth["info"]["email"]
        @auth_user.image = auth["info"]["image"]
        @auth_user.password_digest = UserPassword.new.create_user_password
        @auth_user.save!
      end
      session[:user_id] = @auth_user.id
      redirect_to '/', notice: "Logged in as #{@auth_user.name}"
    rescue StandardError
      if @auth_user.errors.full_messages.present?
        flash[:alert] = @auth_user.errors.full_messages.join(", ")
      else
        flash[:alert] = "Error. Plz Try again later!"
      end
      redirect_to "/login"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/login', notice: 'Logged out!'
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
