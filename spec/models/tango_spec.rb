require 'spec_helper'

describe Tango do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @article = user.articles.create(url: "http://hoge.jp",content: "sample")
    @tango = @article.tangos.build(word: "word", mean: "言葉")
    @tango.user = user
    @tango.save
  end

  subject { @tango }
  
  it { should respond_to(:word) }
  it { should respond_to(:mean) }
  it { should respond_to(:user_id) }
  it { should respond_to(:article_id) }
end
