class StreamsController < ApplicationController
  def show
    @stream =Stream.find_by_id(params[:id])
  end

  def index
    @streams = Stream.all
  end

  def new
    @stream = Stream.new(params[:user])
  end

  def create
    @user = User.find_by_id(params[:id])
    @stream = Stream.new(name: params[:stream][:name], user_id: @user.id)
    if @stream.save
      flash[:success] = "stream added to #{@user.name}"
      redirect_to users_path
    else
      render :action => "new"
    end
  end
end
