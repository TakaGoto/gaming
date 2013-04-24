class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    if auth['provider'] == 'twitch_oauth2'
      require 'pry'
      binding.pry
      user = User.where(:provider => auth['provider'],
                        :uid => auth["uid"].to_s).first || User.create_twitch(auth)
    else
      user = User.where(:provider => auth['provider'],
                        :uid => auth['uid']).first || User.create_with_omniauth(auth)
    end

    session[:user_id] = user.id
    redirect_to root_url, :notice => "Welcome!"
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def new_twitch
    redirect_to '/auth/twitch_oauth2'
  end

  def new
    redirect_to '/auth/facebook'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end
end
