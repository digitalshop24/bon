class MainController < ApplicationController
  def about
  	@categories = Category.all
  end
end
