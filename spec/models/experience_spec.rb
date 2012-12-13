require 'spec_helper'

describe Experience do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @experience = user.experiences.build(name: "Project test", year: 2012)
  end

  subject { @experience }

  it { should respond_to(:name) }
  it { should respond_to(:year) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  
  it { should be_valid }
  
  describe "when user_id is not present" do
    before { @experience.user_id = nil }
    it { should_not be_valid }
  end
  describe "when name not present" do
    before { @experience.name = "" }
    
    it { should_not be_valid }
  end
  describe "when year not present" do
    before { @experience.year = 0 }
    it { should_not be_valid }
  end
  
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Experience.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
end
