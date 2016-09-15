class TagsController < ApplicationController
  def show
    @tag = ActsAsTaggableOn::Tag.find_by_name(params[:name])
    @posts = Post.tagged_with(@tag.name)
  end
end
