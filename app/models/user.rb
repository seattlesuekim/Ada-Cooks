class User < ActiveRecord::Base
  has_many :cookbooks
end
