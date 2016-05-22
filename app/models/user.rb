class User < ActiveRecord::Base
   paginates_per 10
   has_many :user_image
  #validates :name, :mail, presence: true,
  #                        length: { minimum: 5 }
  #attr_accessible :password
  has_secure_password
  #validates_presence_of :password, :on => :create
  mount_uploader :image, ImageUploader
  #accepts_nested_attributes_for :user_image
end
