class CommentsController < ApplicationController
  before_action :set_post, only: [:new, :create, :destroy]

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.save
  end

  # def destroy
  #   @comment = Comment.find(params[:id])
  #   @comment.destroy
  # end

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