class PostsController < ApplicationController
  before_action :authenticate_admin, only: [:new, :create, :edit, :index, :destroy]

  def index
    @posts = Post.page(params[:page]).per(20)
                 .order('created_at desc')
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)

    if post.save!
      redirect_to post_path(post.slug)
    else
      flash.now[:danger] = 'Error'
      render 'new'
    end
  end

  def destroy
    @post = Post.friendly.find(params[:id])
    @post.destroy!
    flash[:success] = 'Post deleted'
    redirect_to page_path
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def update
    @post = Post.friendly.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_path @post.slug
    else
      render 'edit'
    end
  end

  private

  def authenticate_admin
    unless logged_in?
      return redirect_to root_url
    end
    redirect_to root_url unless current_user.admin? || current_user.dev?
  end

  def post_params
    params.require(:post).permit(:title, :short_desc, :content, :published)
  end
end
