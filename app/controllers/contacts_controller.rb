class ContactsController < ApplicationController
  def index
    @contacts = current_user.contacts
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if current_user.contacts.any? {|c| c.phone == params[:contact][:phone].gsub!('-','')}
      flash[:notice] = "Contact already saved."
      redirect_to user_contacts_path(current_user)
    elsif @contact.save
      current_user.contacts << @contact
      flash[:notice] = "Contact saved!"
      redirect_to user_contacts_path(current_user)
    else
      render 'new'
    end
  end

private
  def contact_params
    params.require(:contact).permit(:name, :phone)
  end


end
