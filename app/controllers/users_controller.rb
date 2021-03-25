class UsersController < ApplicationController
  before_action :authorize_admin, only: :index
  def index
    @users =  User.all

    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  private
  def authorize_admin
    redirect_to(root_path) unless current_user && current_user.business?
    #redirects to previous page
  end

end
