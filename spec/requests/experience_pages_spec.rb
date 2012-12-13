require 'spec_helper'

describe "Experience pages" do
  subject { page }
  
  describe "show page" do
    let(:user) { FactoryGirl.create(:user) }
    let(:experiences) { FactoryGirl.create(:experience, year: 2012, user: user) }
    
    before { visit user_experience_path(user, experiences) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: "IT Experience") }
  end
  
  
  
end
