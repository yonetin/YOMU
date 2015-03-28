class ArticlesController < ApplicationController
  before_action :signed_in_user , only: [:create, :destroy]
  require 'open-uri'
  require 'nokogiri'

  def create
    url = article_url_params
    url = url["url"]
    content = create_content(url)

    # buildするコンテンツをハッシュ形式で保存
    article = { :url => url , :content => content }
    @article = current_user.articles.build(article)
    if @article.save
      flash[:success] = "Article created"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  def create_content(url)
    # URLをもとに中身のPタグのコンテンツを抜き出す
    doc = Nokogiri::HTML(open(url))
    @content = doc.xpath('//p').inner_text
    @content
  end


  private

  def article_url_params
    params.require(:article).permit(:url)
  end

end
