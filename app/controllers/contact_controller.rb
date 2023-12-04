class ContactController < ApplicationController
  def new
    @contact_message = Contact.new
  end

  def create
    @contact_message = Contact.new(contact_params)
    if @contact_message.save

      redirect_to root_path, notice: "Votre message a été envoyé avec succès."
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :object, :email, :message)
  end
end
