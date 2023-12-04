class ContactsController < ApplicationController
  def new
    @contact_message = ContactMessage.new
  end

  def create
    @contact_message = ContactMessage.new(contact_params)
    if @contact_message.save
      ContactMailer.contact_email(@contact_message).deliver_now
      redirect_to root_path, notice: "Votre message a été envoyé avec succès."
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact_message).permit(:name, :object, :email, :message)
  end
end
