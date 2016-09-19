class MainController < ApplicationController
	
	def about
		@categories = Category.all
	end

	def main
		@posts = Post.published.order("created_at desc").limit(4)
		@posts_unlim = Post.all
	end
	
	def invitations
		@invitations = Invitation.all.order('created_at DESC')
	end

	def subscriptions
		@subscriptions = Subscription.all.order('created_at DESC')
	end
end


