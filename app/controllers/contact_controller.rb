class ContactController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact  = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Message delivered to the administrator"
      redirect_to contact_index_path
    else
      flash[:notice] = "Unable to create these are the errors"
      render 'contact/index'
    end
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
