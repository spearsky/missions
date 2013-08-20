class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def create_dummy_post
    Post.create!(title: Faker::Lorem.sentence(3),
                 entry: Faker::Lorem.paragraph(10) + Faker::Lorem.paragraph(rand(30)),
                 user: User.random
                 )    
  end
end
