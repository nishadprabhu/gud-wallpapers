# User Controller class
#
# Author:: Stephen, Jason
# Help:: https://auth0.com/docs/quickstart/webapp/rails/03-user-profile

class UsersController < ApplicationController

  # GET /user/:id
  def show
    @user = User.find(params[:id])
  end
end
