class CommentsController < ApplicationController
# http_basic_authenticate_with name: "dhh", password: "secret",
# only: :destroy
respond_to :js, :json, :html

  def create
   @post = Post.find(params[:post_id])
   @comment = @post.comments.new(comment_params)
   @comment.post_id = params[:post_id]
   @comment.save!
   redirect_to post_path(@post)
 end

 def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def like
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def vote
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if !current_user.liked? @comment
      @comment.liked_by current_user
    elsif current_user.liked? @comment
      @comment.unliked_by current_user
    end
  end

 private
   def comment_params
     params.require(:comment).permit(:commenter, :content)
   end
end
