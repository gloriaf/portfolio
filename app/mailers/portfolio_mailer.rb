class PortfolioMailer < ActionMailer::Base
  default from: "info@pabilos.com"


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.portfolio_mailer.summary_experience.subject
  #
  def summary_experience(user, experiences, mail_to)
    @user = user
    @experiences = experiences
    @mail_to = mail_to
    @greeting = "This is the summary of experience of #{@user.name}"

    mail to: @mail_to, subject: 'Summary experience'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.portfolio_mailer.curriculum_vitae.subject
  #
  def curriculum_vitae
    @greeting = "Hi"

    mail to: "to@example.org"
  end
  
   def welcome_email(user)
    @user=user
    @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Welcome to The Portfolio of Experience Site")
  end


end
