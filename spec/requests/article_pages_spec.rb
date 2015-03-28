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

      before { fill_in 'article_url', with: "http://www.yahoo.co.jp" }
      it "should create a article" do
        expect { click_button "Register" }.to change(Article, :count).by(1)
      end
      
      it { should have_content("http://www.yahoo.co.jp") }
      # 登録したArticleの要素をcontentとして表示されていること（未完成）
      it { should have_content("ニュース") }
    end
  end
end
