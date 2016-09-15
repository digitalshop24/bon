class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:index, :edit, :update, :destroy, :new, :create]
  before_filter :require_admin, only: [:edit, :update, :destroy, :new, :create]

  # GET /posts
  # GET /posts.json
  def index
    if current_user.has_role?(:admin)
      @posts = Post.all
      @categories = Category.all
    else
      redirect_to root_path
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @categories = Category.all
    @post_sections = @post.post_sections
    @comments = @post.comments.limit(5).order(created_at: :desc)
    @posts = Post.where(category: @post.category.id)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def update
    @post.assign_attributes(post_params)

    if params[:images]
      params[:images].each { |image|
        @post.images.create(image: image)
      }
    end

    @post.save
    redirect_to @post
  end

  def destroy_image
    @image = Image.find(params[:id])
    @image.destroy
    render 'posts/destroy_image'
  end

  def destroy_image
    @image = Image.find(params[:id])
    @image.destroy
    render 'posts/destroy_image'
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def require_admin
      unless current_user && current_user.has_role?(:admin)
        redirect_to root_path
      end
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :location, :score, :preview, :category_id, :status,
                                   :tag_list, :to_slider, :description)
    end
end
