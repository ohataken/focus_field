class CardSession < ApplicationRecord
  belongs_to :user
  belongs_to :card

  def ongoing?
    end_at.nil?
  end
end
