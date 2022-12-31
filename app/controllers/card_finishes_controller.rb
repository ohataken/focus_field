class CardFinishesController < ApplicationController
  def create
    @resource = current_user.cards.find_by!(id_hex: params[:card_id])
    @resource.update(finished_at: Time.current)

    redirect_to cards_path
  end
end
