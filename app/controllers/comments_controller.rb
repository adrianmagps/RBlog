class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.create!(comment_params)
    respond_to do |format|
        format.html { redirect_to @post }
        format.js
    end
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:name, :email, :body)
    end
end
