class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @loading_items = current_user.loading.paginate(page: params[:page])
      @article = current_user.articles.build
    end
  end

  def help
  end

  def about
  end
end
