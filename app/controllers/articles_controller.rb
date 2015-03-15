class ArticlesController < ApplicationController
  before_action :signed_in_user , only: [:create, :destroy]

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "Article created"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:url)
  end
end
