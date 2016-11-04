class MainController < ApplicationController
	
	def about
		@categories = Category.all
	end

	def main
		@posts = Post.published.order("created_at desc").limit(4)
		@slider_posts = Post.to_slider + SliderPost.all
	end
	
	def invitations
		@invitations = Invitation.all.order('created_at DESC')
	end

	def subscriptions
		@subscriptions = Subscription.all.order('created_at DESC')
	end
end


