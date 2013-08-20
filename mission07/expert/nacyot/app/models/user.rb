class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  has_many :posts
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  def self.random
    find :first, offset: rand(count) unless count == 0 
  end
end
