require "spec_helper"

describe PortfolioMailer do
  before :each do
    @user = FactoryGirl.create(:user)
#    sign_in @user
    @experience = FactoryGirl.create(:experience, user: @user)
  end

  describe "summary_experience" do
    let(:mail) { PortfolioMailer.summary_experience(@user, @experience) }

    it "renders the headers" do
      mail.subject.should eq("Summary experience")
      mail.to.should eq([@user.email])
      mail.from.should eq(["portfolio@pabilos.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

#  describe "curriculum_vitae" do
#    let(:mail) { PortfolioMailer.curriculum_vitae }

#    it "renders the headers" do
#      mail.subject.should eq("Curriculum vitae")
#      mail.to.should eq(["to@example.org"])
#      mail.from.should eq("@user.email")
#    end

#    it "renders the body" do
#      mail.body.encoded.should match("Hi")
#    end
#  end

end
