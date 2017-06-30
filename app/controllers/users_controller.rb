class UsersController < ApplicationController
  def create
    user_names = ["username", "user", "a"]
    # if !params[:username] || !params[:password]
    if !params.has_key?(:username) || params[:username].strip.empty? || !params.has_key?(:password) || params[:password].strip.empty?
      render 'users/create'
    elsif user_names.include? (params[:username])
      flash[:alert] = "Username is already taken. Please pick another."
      render 'users/create'
    else
      user = User.new(params[:first], params[:last], params[:street], params[:city], params[:state], params[:zip], params[:country], params[:email], params[:username], params[:password] )
      cookies[:user] = user.to_yaml
      redirect_to '/users/confirmation'
    end
    def confirmation

    end
    def login
      @user = YAML.load(cookies[:user])
      if !params[:userlogin] && !params[:passlogin]
        render 'users/login'
      elsif params[:userlogin] == @user.show_username && params[:passlogin] == @user.show_password
        @user.loggedin
        cookies[:user] = @user.to_yaml
        redirect_to '/users/welcome'
      else
        flash[:notice] = "Login failed.  Please try again."
        render 'users/login'
      end
    end
    def welcome
      @user = YAML.load(cookies[:user])
    end
    def logout
      redirect_to '/users/create'
    end
  end
end
