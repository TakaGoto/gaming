class StreamsController < ApplicationController
  def show
    @stream =Stream.find_by_name(params[:name])
    @stream_data = (JSON.parse(RestClient.get "https://api.twitch.tv/kraken/streams/#{@stream.name.gsub(/\s+/, "")}"))["stream"]
    if @stream_data == nil?
      flash[:notice] = "that user is not online"
      redirect_to root_url
    end
  end

  def index
    @streams = Stream.all
    @list_of_streams = @streams.reduce("") do |stream_list, stream|
      (stream_list << ("#{stream.name},").gsub(/\s+/, ""))
    end

    @online_streams = (JSON.parse(RestClient.get "https://api.twitch.tv/kraken/streams?channel=#{@list_of_streams}"))["streams"]
    if @online_streams.empty?
      redirect_to featured_streams_path
    end
  end

  def featured_index
    @featured_streams = (JSON.parse(RestClient.get "https://api.twitch.tv/kraken/streams/featured?limit=20"))["featured"]
  end

  def show_featured
    @stream_name = params[:name]
    @stream_data = (JSON.parse(RestClient.get "https://api.twitch.tv/kraken/streams/#{params[:name].gsub(/\s+/, "")}"))["stream"]
  end

  def new
    @stream = Stream.new(params[:user])
  end

  def create
    @user = User.find_by_id(params[:id])
    @stream = Stream.new(name: (params[:stream][:name]).downcase.gsub(/\s+/, ""), user_id: @user.id)
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
