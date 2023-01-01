class CardImagesController < ApplicationController
  def show
    expires_in 1.years

    @resource = current_user.cards.find_by!(id_hex: params[:card_id])
    send_data @resource.create_image, type: "image/png", disposition: "inline", filename: @resource.image_filename
  end
end
