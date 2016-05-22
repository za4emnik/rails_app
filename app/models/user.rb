class User < ActiveRecord::Base
  #validates :name, :mail, presence: true,
  #                        length: { minimum: 5 }
  #attr_accessible :password
  has_secure_password
  #validates_presence_of :password, :on => :create
end
