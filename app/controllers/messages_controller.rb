class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new
    params['to_tags'].each do |to_phone|
      message = Message.new(:to => to_phone, :from => message_params[:from], :body=> message_params[:body])
      if message.save
        current_user.messages << message
        flash[:notice] = 'Message sent'
        if params[:save_contact] == '1' && !current_user.contacts.any? {|c| c.phone == message.to}
          current_user.contacts.create(:phone => message.to, :name => params[:name])
          flash[:notice] = 'Contact added'
        end
      end
    end
    redirect_to root_path
  end

  def show
    @message = Message.find(params[:id])
    @message.find_status
  end

private
  def message_params
    params.require(:message).permit(:to, :from, :body, :status)
  end
end
