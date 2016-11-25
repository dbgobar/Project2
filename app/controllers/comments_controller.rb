class CommentsController < ApplicationController
# http_basic_authenticate_with name: "dhh", password: "secret",
# only: :destroy
# this is where you could add comments under users that are signed in. something like this:
# @comment.user = current_user
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

 private
   def comment_params
     params.require(:comment).permit(:commenter, :content)
   end
end