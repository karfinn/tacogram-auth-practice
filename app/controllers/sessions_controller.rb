class SessionsController < ApplicationController
  def new
  end
  
  def create
    # TODO: authenticate user
    # find the user by their id
    @user = User.find_by({"email" => params["email"]})
    # if user exists (not nil), check if know their password
    if @user != nil
      # if know their password, log them in, add cookies
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Hey, #{@user["first_name"]}"
        redirect_to "/posts"
      # if user's password is wrong
      else
        flash["notice"] = "Sorry."
        redirect_to "/login"
      end 
    else
      # user does not exist
       flash["notice"] = "Try again."
       redirect_to "/login"
    end 
  end 

def destroy
  # logout the user, ended the session and delete cookies
  flash["notice"] = "Goodbye."
  session["user_id"] = nil
  redirect_to "/login"
  end
end


