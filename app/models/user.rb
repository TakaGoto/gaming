class User < ActiveRecord::Base
  attr_protected :provider, :uid
  attr_accessible :stream_id, :name, :email
  has_one :stream

  has_many :blogs

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['email'] || ""
      end
    end
  end
end
