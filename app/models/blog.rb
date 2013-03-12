class Blog < ActiveRecord::Base
  attr_accessible :banner_image, :content, :summary, :title, :user_id

  validates_presence_of :title, :content, :summary, :banner_image
  validates_uniqueness_of :title

  belongs_to :user
end
