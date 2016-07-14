class WelcomeController < ApplicationController

  def home
    @users = User.all
    @designs = Design.all
    @stones = Stone.all
  end

end
