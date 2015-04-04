class ArticlesController < ApplicationController
  before_action :signed_in_user , only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  require 'open-uri'
  require 'nokogiri'

  def create
    url = article_url_params
    url = url["url"]
    content = create_content(url)
    article = content

    # title レコードを追加する必要あり
    # buildするコンテンツをハッシュ形式で保存
    # article = { :url => url , :content => content }
    @article = current_user.articles.build(article)
    if @article.save
      flash[:success] = "Article created"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @article.destroy
    redirect_to root_url
  end

  def create_content(url)
    # URLをもとに中身のPタグのコンテンツを抜き出す
    begin
      doc = Nokogiri::HTML(open(url))
      title = doc.xpath('//title').inner_text
      content = doc.xpath('//p').inner_text

      @content = { :url => url, :content => content ,:title => title}
    rescue
      doc = { :url => "error" , :content => "error"}
    end
  end



  private

  def article_url_params
    params.require(:article).permit(:url)
  end

  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to root_url if @article.nil?
  end
end
