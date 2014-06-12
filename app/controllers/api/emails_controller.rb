module Api
  class EmailsController < ApplicationController
    protect_from_forgery except: [:send_email]

    def send_email
      emailer = Emailer.send_email(email_params)

      emailer.deliver

      head :ok
    end

    private

    def email_params
      params.require(:email).permit(:to, :subject, :body)
    end
  end
end