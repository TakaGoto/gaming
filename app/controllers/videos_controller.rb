class VideosController < ApplicationController
  def index
    @yt_videos = yt_client.my_videos.videos
  end

  def show
    @yt_video = yt_client.video_by(params[:id])
  end
end
