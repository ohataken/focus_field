class ChildCardsController < ApplicationController
  def index
    @parent_card = current_user.cards.parent_cards.find_by!(id_hex: params[:card_id])
    @resources = @parent_card.child_cards.order_by_created_at_asc
  end

  def show
  end

  def edit
  end
end
