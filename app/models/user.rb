class User < ActiveRecord::Base
  validates :name, :mail, presence: true,
                          length: { minimum: 5 }
end
