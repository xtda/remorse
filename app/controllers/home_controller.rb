class HomeController < ApplicationController
  def index
    @posts = Post.where(published: true, featurette: false).page(params[:page]).per(6)
                 .order('created_at desc')

    @featurette = Post.where(featurette: true).first
  end
end
