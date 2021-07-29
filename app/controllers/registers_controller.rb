class RegistersController < ApplicationController
  def index
  end
  
  def create
    user = User.new(user_params)
    if user.save
        session[:user_id] = user.id
        session[:user_name] = user.name
        redirect_to '/room'
    else
        flash[:register_errors] = user.errors.full_messages
        redirect_to '/register'
    end
  end
  private
    def user_params
        params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
