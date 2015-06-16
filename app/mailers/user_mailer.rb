class UserMailer < ApplicationMailer
  default from: 'Odin-facebook@example.com'

  def welcome_mail(name, email)
    @name = name
    @email = email
    mail(to: email, subject: 'Welcome to Odin-facebook!')
  end

end
