class SliderPostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:index, :edit, :update, :destroy, :new, :create]
  before_filter :require_admin, only: [:edit, :update, :destroy, :new, :create, :index]


  def index
    @posts = SliderPost.all
  end

  # GET /posts/new
  def new
    @post = SliderPost.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = SliderPost.create(post_params)
    redirect_to root_path
  end

  def update
    @post.assign_attributes(post_params)
    @post.save
    redirect_to root_path
  end

  def destroy
    @post.destroy
    redirect_to slider_posts_path
  end

  private

  def require_admin
    unless current_user && current_user.has_role?(:admin)
      redirect_to root_path
    end
  end

  def set_post
    @post = SliderPost.find(params[:id])
  end

  def post_params
    params.require(:slider_post).permit(:title, :preview, :url, :description)
  end
end
