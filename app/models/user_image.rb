class UserImage < ActiveRecord::Base
  paginates_per 5
   mount_uploader :image, ImageUploader
   belongs_to :user
end
