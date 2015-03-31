require 'spec_helper'

describe "ArticlePages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "article creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a article" do
        expect { click_button "Register"}.not_to change(Article, :count)
      end

      describe "error massages" do
        before { click_button "Register" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'article_url',
        with: "http://www.animenewsnetwork.com/shelf-life/2015-03-30/.86540" }
      it "should create a article" do
        expect { click_button "Register" }.to change(Article, :count).by(1)
      end
      
      # URLの登録を確認する
      it { should have_content("http://www.animenewsnetwork.com/shelf-life/2015-03-30/.86540") }
      # 登録したArticleの要素をcontentとして表示されていること（未完成）
      # 一旦ペンディング事項として扱う
      it { should have_content("three") }
    end
  end
end
