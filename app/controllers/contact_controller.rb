class ContactController < ApplicationController
  def new
    @contact_message = Contact.new
  end

  def create
    @contact_message = Contact.new(contact_params)

    if @contact_message.valid?
      ContactMailer.contact_email(@contact_message).deliver_now
      flash[:success] = "Votre message a été envoyé avec succès."
      redirect_to root_path
    else
      flash[:error] = "Votre message n'a malheureusement pas été envoyé. Vérifiez si vous avez bien rempli tous les champs."
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :prenom, :object, :email, :message, :nickname)
  end
end
