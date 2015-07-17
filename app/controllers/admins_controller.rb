class AdminsController < ApplicationController

  before_filter :authenticate_user!

  def show
    @user = User.new
  end

  def update
    @user = User.new(email: params[:user].require(:email))
    @user.set_random_password
    if @user.save
      redirect_to admin_url
    else
      render action: 'show'
    end
  end

end
