class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      current_user.messages << @message
      flash[:notice] = "Message sent."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @message = Message.find(params[:id])
  end

private
  def message_params
    params.require(:message).permit(:to, :from, :body, :status)
  end
end
