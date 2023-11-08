class ContactFormController < ApplicationController

  def create
    @name = params[:contact_form][:name]
    @last_name = params[:contact_form][:last_name]
    @email = params[:contact_form][:email]
    @message = params[:contact_form][:message]

    begin
      # Attempt to send the email
      NotifierMailer.simple_message(@name, @last_name, @email, @message).deliver_now
      flash[:success] = "Your message has been sent successfully."
      redirect_to :root
    rescue Errno::ECONNREFUSED => e
      flash[:alert] = "An error occurred while sending the email. Please try again later."
      redirect_to :root
    end
  end

end
