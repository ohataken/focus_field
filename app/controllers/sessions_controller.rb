class SessionsController < ApplicationController
  def new
  end

  def create
    @resource = User.find_by!(name: params[:name])
    @resource.password = params[:password]

    if @resource.match_password?
      session[:user_id] = @resource.id
      redirect_to cards_path
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to sessions_path
  end
end
