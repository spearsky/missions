class WelcomeController < ApplicationController
  def index  	
  	@communities = Community.all
  	unless current_user.nil?
  		@posts = current_user.posts
  	end  	
  end
end
