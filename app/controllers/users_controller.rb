class UsersController < ApplicationController
  # creates user account on registration page and checks for validity
  def create
    user_names = ["username", "user", "a"]
    # if !params[:username] || !params[:password]
    #checks if it has a username/password and it is not an empty field
    if !params.has_key?(:username) || params[:username].strip.empty? || !params.has_key?(:password) || params[:password].strip.empty?
      render 'users/create'
      #checks against user-name array for existing usernames
    elsif user_names.include? (params[:username])
      flash[:alert] = "Username is already taken. Please pick another."
      render 'users/create'
      #if passes all tests, create and store username object
    else
      user = User.new(params[:first], params[:last], params[:street], params[:city], params[:state], params[:zip], params[:country], params[:email], params[:username], params[:password] )
      cookies[:user] = user.to_yaml
      redirect_to '/users/confirmation'
    end
    #routes to confirmation page
    def confirmation

    end
    #checks if login credentials are valid
    def login
      @user = YAML.load(cookies[:user])
      #if null, do not let user continue
      if !params[:userlogin] && !params[:passlogin]
        render 'users/login'
        #if valid move to welcome page and reassign logged in to true
      elsif params[:userlogin] == @user.show_username && params[:passlogin] == @user.show_password
        @user.loggedin
        cookies[:user] = @user.to_yaml
        redirect_to '/users/welcome'
        #if not valid login, alert user
      else
        flash[:notice] = "Login failed.  Please try again."
        render 'users/login'
      end
    end
    #load user cookies to display on welcome page
    def welcome
      @user = YAML.load(cookies[:user])
    end
    #return to homepage after logging out
    def logout
      redirect_to '/users/create'
    end
  end
end
