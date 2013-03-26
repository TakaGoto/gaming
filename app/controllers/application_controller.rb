class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?

  before_filter :check_url

  def check_url
    if request.host == "enigmatic-taiga-1462.herokuapp.com" then
      redirect_to request.protocal + "www.terrorgaming.net" + request.fullpath
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
