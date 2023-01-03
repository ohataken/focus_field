module CardsHelper
  def card_session_elapsed_time card_session
    if card_session and card_session.ongoing?
      duration = card_session.duration
      minutes = duration / 60
      seconds = duration % 60

      format "%02d:%02d", minutes, seconds
    end
  end
end
