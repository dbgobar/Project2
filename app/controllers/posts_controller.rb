class PostsController < ApplicationController
# if you aren't using basic auth, get rid of it! Having this code in here could potentially signal to employers that much of this code was largely taken from that tutorial.
  # http_basic_authenticate_with name: "dhh", password: "secret",
  # except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    redirect_to root_path unless @current_user
    @post = Post.create(post_params)
    @post.save
    redirect_to @post
  end

  def update
    redirect_to root_path unless @current_user
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    redirect_to root_path unless @current_user
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:name, :photo_url, :description, :resume)
  end


end
