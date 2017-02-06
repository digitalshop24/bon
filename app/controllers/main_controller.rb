class MainController < ApplicationController
	
	def about
		@about_center = PageText.where(page: 'about', position: 'center').first_or_create
		@categories = Category.all
	end

	def main
		@main_bottom = PageText.where(page: 'main', position: 'bottom').first_or_create
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


