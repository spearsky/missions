class Community < ActiveRecord::Base
	has_many :roles
	has_many :users, :through => :roles
	has_many :posts
end
