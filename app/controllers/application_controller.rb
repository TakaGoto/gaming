class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?
  helper_method :ty_client

  before_filter :check_url

  def yt_client
    @yt_client ||= YouTubeIt::Client.new(:username => "ChicagoTERRORGaming", :password => "Bokuwakuma1!", :dev_key => "AI39si59MWdVUf7ZLNvJ0polxZuzDnJbspD-HXUTTReZmZ9YkqkLs_imORwFuoNiHOBIJ8lNq5FXWmOcMGznc3OR8dFK55k-UA")
  end

  def get_twitch_stream(name)
    (JSON.parse(RestClient.get "https://api.twitch.tv/kraken/streams/#{name.gsub(/\s+/, "")}"))["stream"]
  end

  def get_stream_list(streams)
    (JSON.parse(RestClient.get "https://api.twitch.tv/kraken/streams?channel=#{streams}"))["streams"]
  end

  def get_featured_streams
    (JSON.parse(RestClient.get "https://api.twitch.tv/kraken/streams/featured?limit=20"))["featured"]
  end

  def check_url
    if request.host == "enigmatic-taiga-1462.herokuapp.com" then
      redirect_to request.protocol + "www.terrorgaming.net" + request.fullpath
    end
  end

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def user_signed_in?
      return true if current_user
    end

    def correct_user?
      @user = User.find(params[:id])
      unless current_user == @user
        redirect_to root_url, :alert => "Access denided."
      end
    end

    def authenticate_user!
      if !current_user
        redirect_to root_url, :alert => 'You need to sign for access to this page.'
      end
    end
end
