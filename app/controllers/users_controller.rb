class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @classifieds = @user.classifieds.all.includes(:city)

  end

end


