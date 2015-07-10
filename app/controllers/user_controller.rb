class UserController < ApplicationController
  def landing

  end

  def registered
    @user = User.new
  end

  def create_login_session
    @user= User.authenticate(params[:name], params[:password])
    if @user
      render :Function_module
    else
      redirect_to :landing
    end
  end

  # def new
  #   @user = User.new
  # end

  def landing
    cookies.delete(:token)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :root
    else
      for message in @user.errors.messages
        session[:warning] = message[1][0]
      end

      render 'registered'
    end
  end

  def user_params
    params.require(:user).permit!
    # params. permit(:name,:password,:role)
  end
end
