class Contact < MailForm::Base
  attribute :object, validate: true
  attribute :name, validate: true
  attribute :prenom, validate: true
  attribute :email, validate: true
  attribute :message, validate: true

  def headers
    {
      #this is the subject for the email generated, it can be anything you want
      subject: "Message d'Ad.andforward",
      to: 'ad.andforward@gmail.com',
      from: %("#{name}, #{prenom}" <#{email}>)
    }
  end
end
