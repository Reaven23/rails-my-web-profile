class Contact < MailForm::Base
  attribute :name
  attribute :email
  attribute :object
  attribute :message

  def headers
    {
      :subject => "sending email"
      :to => "ad.andforward@gmail.com"
      :from
    }
  end
end
