class TwitterUser < ActiveRecord::Base
  has_many :tweets

  validates :handle, uniqueness: true
end
