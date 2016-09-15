class CommentsController < ApplicationController
  before_action :set_post, only: [:new, :create, :destroy, :update, :edit]

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.assign_attributes(comment_params)
    @comment.save
  end

  private

    def comment_params
      params.require(:comment).permit(
          :title,
          :text,
          :name,
          :email,
          :post_id
      )
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end