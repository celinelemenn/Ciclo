class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #

  # default :from => MyApp::Application.config.postmark_signature

  def reset_password_instructions(user)
    @resource = user
    mail(to: @resource.email,
         subject: "Reset password instructions",
         tag: 'password-reset',
         content_type: "text/html") do |format|
      format.html { render "devise/mailer/reset_password_instructions" }
    end
  end

  def welcome
    @user = params[:user]
    @greeting = "Hi"

    mail(to: @user.email, subject: 'Welcome to Cyclo', )
  end
end
