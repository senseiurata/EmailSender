class Emailer < ActionMailer::Base
  default from: ENV["emailer_from"],
          reply_to: ENV["emailer_from"]

  def send_email(email_attr)
    @body = email_attr["body"]

    mail(to: email_attr["to"], subject: email_attr["subject"])
  end
end
