class MainController < ApplicationController
	  
	def about
		@categories = Category.all
	end
	def main
		@posts = Post.order("created_at desc").limit(4)
		@posts_unlim = Post.all
	end
end

