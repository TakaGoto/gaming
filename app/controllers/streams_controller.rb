class StreamsController < ApplicationController
  def show
    @stream =Stream.find_by_id(params[:id])
  end

  def index
    @streams = Stream.all
    @list_of_streams = @streams.reduce("") do |stream_list, stream|
      (stream_list << ("#{stream.name},").gsub(/\s+/, ""))
    end
    @online_streams = (JSON.parse(RestClient.get "https://api.twitch.tv/kraken/streams?channel=#{@list_of_streams}"))["streams"]
  end

  def new
    @stream = Stream.new(params[:user])
  end

  def create
    @user = User.find_by_id(params[:id])
    @stream = Stream.new(name: (params[:stream][:name]).gsub(/\s+/, ""), user_id: @user.id)
    if @stream.save
      flash[:success] = "stream added to #{@user.name}"
      redirect_to users_path
    else
      render :action => "new"
    end
  end

  def edit
    @stream = Stream.find_by_id(params[:id])
  end

  def update
    @stream = Stream.find_by_id(params[:id])
    @stream.update_attributes(params[:stream])
    redirect_to users_path
  end
end
