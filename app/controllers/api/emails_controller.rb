module Api
  class EmailsController < ApplicationController
    protect_from_forgery except: [:send_email]

    def send_email
      emailer = Emailer.send_email

      emailer.deliver

      render json: {}
    end
  end
end