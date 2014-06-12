class Emailer < ActionMailer::Base
  default from: ENV["emailer_from"],
          reply_to: ENV["emailer_from"]

  def send_email
    mail(to: ENV["test_email"], subject: "Test")
  end
end
