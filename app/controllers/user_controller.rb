class UserController < ApplicationController
  def landing

  end

  def user_registered
    @user =User.new
  end

  def create_login_session
    @user= User.authenticate(params[:name], params[:password])
    if @user
      render :registered
    else
      redirect_to :landing
    end
  end

  def new
    @contact = Contact.new
  end

  def landing
    cookies.delete(:token)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :root
    else
      render :registered
    end
  end

  def user_params
    params.require(:user).permit!
    # params. permit(:name,:password,:role)
  end
end
