class UsersController < ApplicationController
  def signup
  	@user=User.new
  end
  def create
  	user=User.new(user_params)
  	user.save
  	redirect_to :root
  end

  private
	  def user_params
	    params.require(:user).permit!
	  end

end
