class UsersController < ApplicationController
  def show
    if params[:id].nil?
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end
end
