module CardsHelper
  def card_status_tag card
    if card.has_ongoing_session?
      tag.span "doing", class: "tag is-small is-danger"
    elsif card.finished?
      tag.span "done", class: "tag is-small is-light is-light"
    elsif card.unfinished?
      tag.span "todo", class: "tag is-small is-info is-light"
    else
    end
  end

  def card_session_elapsed_time card_session
    if card_session and card_session.ongoing?
      duration = card_session.duration
      minutes = duration / 60
      seconds = duration % 60

      format "%02d:%02d", minutes, seconds
    end
  end
end
