class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    # puts "------------------ code before every request ------------------"
    # Optional: @current_user = ..., shows the users name on every path
    @current_user = User.find_by({"id" => session["user_id"]})
  end

end
