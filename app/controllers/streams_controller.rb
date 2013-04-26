class StreamsController < ApplicationController
  def show
    @stream_name = params[:name]
    @stream_data = get_twitch_stream(params[:name])
    redirect_to streams_path, :notice => "the user is not online" if @stream_data.nil?
  end

  def index
    @streams = Stream.all
    @list_of_streams = @streams.reduce("") do |stream_list, stream|
      (stream_list << ("#{stream.name},").gsub(/\s+/, ""))
    end

    @online_streams = get_stream_list(@list_of_streams)
    redirect_to featured_streams_path if @online_streams.empty?
  end

  def featured_index
    @featured_streams = get_featured_streams
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
