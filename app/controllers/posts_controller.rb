class PostsController < ApplicationController
  before_action :logged_in_user
  def index
    @posts = current_user.feed.order(created_at: :desc)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post Created Successfully"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post Updated Successfully"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:success] = "Post Deleted Successfully"
    redirect_back(fallback_location: request.referer)
  end

  private
    def post_params
      params.require(:post).permit(:content, :is_private)
    end
end
