class HomeController < ApplicationController
  def index
  end
  
  def create
    user = User.find_by(email:login_params[:email])
    if user && user.authenticate(login_params[:password])
        session[:user_id] = user.id
        session[:user_name] = user.name
        redirect_to '/room'
    else
        flash[:login_errors] = ['Invalid Credentials']
        redirect_to '/'
    end
end

private
    def login_params
        params.require(:login).permit(:email, :password)            
    end
end
