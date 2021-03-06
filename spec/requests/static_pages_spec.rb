require 'spec_helper'

describe "Static pages" do
  
  subject { page }
  
  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_content(page_title) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Portfolio of Experience' }
    let(:page_title) { '' }
    
    it_should_behave_like "all static pages"
    it { should_not have_content '| Home' }
    
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end
      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_content(item.content)
        end
      end
    end
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }
    
    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading)    { 'About' }
    let(:page_title) { 'About' }
    
    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }
    
    it_should_behave_like "all static pages"
  end

  describe "News page" do
    before { visit news_path }
    let(:heading)    { 'News' }
    let(:page_title) { 'News' }
    
    it_should_behave_like "all static pages"
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_content 'About Us'
    click_link "Help"
    page.should # fill in
    click_link "Contact"
    page.should # fill in
    click_link "News"
    page.should have_content 'News'
    click_link "Home"
    click_link "Sign up now!"
    page.should # fill in
  end
  
  
  
end
