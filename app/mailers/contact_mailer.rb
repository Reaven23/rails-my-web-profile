class ContactMailer < ApplicationMailer
  def contact_email(contact_message)
    @contact_message = contact_message
    mail(to: 'ad.andforward@gmail.com', subject: 'Nouveau message de contact')
  end
end
