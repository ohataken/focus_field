class CardSessionsController < ApplicationController
  def create
    @resource = current_user.cards.unfinished.find_by! id_hex: params[:card_id]
    @resource.start_session! unless @resource.has_ongoing_session?

    redirect_to cards_path
  end

  def destroy
    @resource = current_user.cards.unfinished.find_by! id_hex: params[:card_id]
    @resource.end_session! if @resource.has_ongoing_session?

    redirect_to cards_path
  end
end
