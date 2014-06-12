class Emailer < ActionMailer::Base
  default from: ENV["emailer_from"]

  def send_email(email_params)
    @body = email_params["body"]

    mail(to: email_params["to"], subject: email_params["subject"])
  end
end
