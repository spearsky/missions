class Post < ActiveRecord::Base
  belongs_to :user
  mount_uploader :photo, PhotoUploader

	validates_presence_of :user_id, :title, :photo
end
