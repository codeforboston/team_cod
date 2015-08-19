class EventMailer < ApplicationMailer
  def welcome(user)
     mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end
end
