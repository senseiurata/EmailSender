# Load the Rails application.
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
  :user_name => ENV["sendgrid_user_name"],
  :password => ENV["sendgrid_password"],
  :domain => 'example.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

# ActionMailer::Base.smtp_settings = {
#   :user_name => ENV["yahoo_user_name"],
#   :password => ENV["yahoo_password"],
#   :domain => 'example.com',
#   :address => 'smtp.mail.yahoo.com',
#   :port => 587,
#   :authentication => :plain,
#   :enable_starttls_auto => true
# }

# Initialize the Rails application.
Rails.application.initialize!