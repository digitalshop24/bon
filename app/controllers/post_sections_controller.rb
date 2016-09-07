class PostSectionsController < ApplicationController
 # before_action :fetch_post
  before_action :fetch_post_section, only: [:edit, :update, :destroy]
  #before_action :fetch_category


  def new
    @post = Post.find(params[:post_id])
    @post_section = @post.post_sections.build
  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @post_section = @post.post_sections.build(post_section_params)
    @post_section.save
  end

  def update
    @post = Post.find(params[:post_id])
    @post_section.assign_attributes(post_section_params)
    @post_section.save
  end

  def destroy
    @post_section.destroy
  end

  private

  def fetch_post_section
    @post_section = PostSection.find(params[:id])
  end

  def fetch_post
    @post = Post.find(params[:id]) || @post_section.post
  end

  def fetch_category
    @category = @post.category
  end

  def post_section_params
    params.require(:post_section).permit(
        :title,
        :description,
        :has_description,
        :score
    )
  end
end
