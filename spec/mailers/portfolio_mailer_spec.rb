require "spec_helper"

describe PortfolioMailer do
  before :each do
    @user = FactoryGirl.create(:user)
#    sign_in @user
    @experience = FactoryGirl.create(:experience, user: @user)
    @experiences = @user.experiences.all

    @mail_to = @user.email
  end

  describe "summary_experience" do
    let(:mail) { PortfolioMailer.summary_experience(@user, @experiences, @mail_to) }

    it "renders the headers" do
      mail.subject.should eq("Summary experience")
      mail.to.should eq([@mail_to])
      mail.from.should eq(["info@pabilos.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Summary of experience")
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
