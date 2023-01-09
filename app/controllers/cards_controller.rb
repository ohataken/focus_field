class CardsController < ApplicationController
  def index
    @resources = current_user.cards.parent_cards.order_by_created_at_asc
  end

  def new
    @resource = current_user.cards.build
  end

  def create
    @resource = current_user.cards.build(resource_params)

    if @resource.save
      redirect_to cards_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @resource = current_user.cards.parent_cards.find_by!(id_hex: params[:id])
  end

  def update
    @resource = current_user.cards.parent_cards.find_by!(id_hex: params[:id])

    if @resource.update(resource_params)
      redirect_to cards_path
    else
      render :edit
    end
  end

  def resource_params
    params.require(:card).permit(:name)
  end
end
