require 'spec_helper'
require 'minitest/autorun'

describe "Static Pages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App | " }
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_title("#{base_title}#{page_title}") }
  end

  describe "Home page" do
    #before { visit root_path }
    #let(:heading) { 'Sample App' }
    #let(:page_title) { 'Home' }

    #it_should_behave_like "all static pages"

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:article, user: user, url: "http://www.yahoo.co.jp")
        FactoryGirl.create(:article, user: user, url: "http://www.google.com")
        sign_in user
        visit root_path
      end

      it "should render the user's loading" do
        user.loading.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.url)
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user))}
        it { should have_link("1 followers", href: followers_user_path(user))}
      end
    end
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading) { 'About' }
    let(:page_title) { 'About Us' }

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading) { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like "all static pages"
  end
    # expect(page).to have_title("#{base_title}Contact")
    # click_link "Sign up now!"

  it "should have the right links on the layout" do
    # visit root_path
    # click_link "About"
    # expect(page).to have_title("#{base_title}About Us")
    # click_link "Help"
    # expect(page).to have_title("#{base_title}Help")
    # click_link "Contact"
    # expect(page).to have_title("#{base_title}Sign up")
    # click_link "sample app"
    # expect(page).to have_title("#{base_title}Home")
 
  end 
end

