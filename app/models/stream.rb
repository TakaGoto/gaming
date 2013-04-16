class Stream < ActiveRecord::Base
  attr_accessible :name, :user_id
  belongs_to :user

  def status
    twitch["stream"]
  end

  def twitch
    @stream ||= JSON.parse(RestClient.get "https://api.twitch.tv/kraken/streams/#{name.gsub(/\s+/, "")}")
  end
end
