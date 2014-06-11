class Emailer < ActionMailer::Base
  default from: "noreply@example.com"

  def send_email
    mail(to: ENV["test_email"], subject: "Test")
  end
end
