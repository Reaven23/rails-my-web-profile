class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: true
  attribute :message
  attribute :object

  def headers
    {
      #this is the subject for the email generated, it can be anything you want
      subject: "#{object}",
      to: 'ad.andforward@gmail.com',
      from: %("#{name}" <#{email}>)
    }
  end
end
