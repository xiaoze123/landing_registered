
class UserController < ApplicationController
  def landing
  end

  def user_registered
    @user =User.new
  end

  def create_login_session
  end

  def new
    @contact = Contact.new
  end

  def landing
    cookies.delete(:token)re
  end

  def create
      @user = User.new(user_params)
      if @user.save
        redirect_to :root
      else
        render :registered
      end
    end

  private
  def user_params
    # params.require(:user).permit!
    params. permit(:name,:password,:role)
  end
end
