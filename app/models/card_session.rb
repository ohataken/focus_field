class CardSession < ApplicationRecord
  belongs_to :user
  belongs_to :card

  def ongoing?
    end_at.nil?
  end

  def ended?
    end_at.present?
  end
end
