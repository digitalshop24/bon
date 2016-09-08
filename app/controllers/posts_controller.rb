class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  before_filter :require_admin, only: [:edit, :update, :destroy, :new, :create]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    #@post_rest =  Post.where(:category => Category.find(1))
    @categories = Category.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @categories = Category.all
    @post_sections = @post.post_sections
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

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post.assign_attributes(post_params)
    @post.save
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
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

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :location, :score, :image, :category_id, :status, :tag_list)
    end
end
