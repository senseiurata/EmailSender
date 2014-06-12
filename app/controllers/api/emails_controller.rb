module Api
  class EmailsController < ApplicationController
    protect_from_forgery except: [:send_email]

    def send_email
      email_attr = email_params
      
      email_attr["to"] = parse_email(email_attr["to"])

      #explicitly set to empty string. otherwise default subject is function name "Send email"
      email_attr["subject"] ||= ""

      unless email_attr["to"].nil?
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

    def parse_email(email)
      matches = /[\w+\-.]+@[a-z\d\-.]+\.[a-z]+/i.match(email)

      matches ? matches[0] : nil
    end

    def email_params
      params.require(:email).permit(:to, :subject, :body)
    end
  end
end