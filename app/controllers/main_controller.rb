class MainController < ApplicationController
  def about
  	@categories = Category.all
  	@tags = Tag.all
  end
end
