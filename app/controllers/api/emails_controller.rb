module Api
  class EmailsController < ApplicationController
    protect_from_forgery except: [:send_email]

    def send_email
      email_attr = email_params
      
      #explicitly set to empty string. otherwise default subject is function name "Send email"
      email_attr["subject"] ||= ""

      if valid_email?(email_attr["to"])
        emailer = Emailer.send_email(email_attr)

        emailer.deliver

        head :ok
      else
        @errors ||= []
        @errors.push("Invalid email!")

        render json: { errors: @errors }, status: :unprocessable_entity
      end
    end

    private

    def valid_email?(email)
      /[\w+\-.]+@[a-z\d\-.]+\.[a-z]+/i.match(email)
    end

    def email_params
      params.require(:email).permit(:to, :subject, :body)
    end
  end
end