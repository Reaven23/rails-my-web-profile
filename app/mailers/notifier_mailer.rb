class NotifierMailer < ApplicationMailer
  default to: "ad.andforward@gmail.com",
          from: "contact@your-domain"

  def simple_message(first_name, last_name, email, message)
    mail(
      'reply-to': email_address_with_name(email, "#{first_name} #{last_name}"),
      subject: "New message from #{first_name} #{last_name} : #{email}",
      body: message
    )
  end
end
