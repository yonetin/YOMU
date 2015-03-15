require 'spec_helper'

describe Article do

  let(:user) { FactoryGirl.create(:user) }
  before { @article = user.articles.build(url: "http://hoge.jp", content: "sample") }

  subject { @article }

  it { should respond_to(:url) }
  it { should respond_to(:content) }
  it { should respond_to(:words_count) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @article.user_id = nil }
    it { should_not be_valid }
  end
end
