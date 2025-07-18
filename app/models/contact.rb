class Contact < MailForm::Base
  attribute :object, validate: true
  attribute :name, validate: true
  attribute :prenom, validate: true
  attribute :email, validate: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "format d'email invalide"}
  attribute :message, validate: true
  attribute :nickname, captcha: true

  validate :email_not_blacklisted

  BLACKLISTED_EMAILS = ['ericjonesmyemail@gmail.com', 'zekisuquc419@gmail.com', 'xiceruxuk02@gmail.com', "pazapz@mailbox.in.ua", "fiskathr@gmail.com", "cordner.willis@gmail.com", "yawiviseya67@gmail.com", "erica.daily23@gmail.com", "dinanikolskaya99@gmail.com"]

  def email_not_blacklisted
    if BLACKLISTED_EMAILS.include?(email.downcase)
      Rails.logger.warn("[SPAM BLOQUÉ] Email #{email} a tenté d'envoyer un message.")
      errors.add(:email, 'est bloquée pour cause d’abus')
    end
  end

  def headers
    {
      subject: "Message d'Ad.andforward",
      to: 'ad.andforward@gmail.com',
      from: %("#{name}, #{prenom}" <#{email}>)
    }
  end


end
