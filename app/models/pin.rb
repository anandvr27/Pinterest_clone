class Pin < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	acts_as_votable
	belongs_to :user
end
