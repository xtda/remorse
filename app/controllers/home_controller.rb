class HomeController < ApplicationController
  def index
    @posts = Post.where(published: true).page(params[:page]).per(6)
                 .order('created_at desc')
  end
end
