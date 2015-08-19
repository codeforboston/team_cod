# Preview all emails at http://localhost:3000/rails/mailers/event_mailer
class EventMailerPreview < ActionMailer::Preview

  def welcome
    EventMailer.welcome(User.first)
  end
end
