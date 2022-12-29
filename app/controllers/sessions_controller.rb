class SessionsController < ApplicationController
  def new
  end

  def create
    @resource = User.find_by!(name: params[:name])
    session[:user_id] = @resource.id
    redirect_to sessions_path
  end

  def destroy
    session.delete(:user_id)
    redirect_to sessions_path
  end
end
