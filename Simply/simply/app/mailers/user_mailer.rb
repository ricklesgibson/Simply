class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.forgot_password.subject
  #
  def forgot_password
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    #generate a welcome email when a user is generated
    @greeting = "Hi! Welcome to Simply, #{user.first_name}!"
    #@greeting = "Hi! #{user.name}"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.getting_started.subject
  #
  def getting_started
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
