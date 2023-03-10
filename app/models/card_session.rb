class CardSession < ApplicationRecord
  belongs_to :user
  belongs_to :card
  validates :start_at, presence: true

  scope :ongoing, -> { where(end_at: nil) }
  scope :ended, -> { where.not(end_at: nil) }

  def ongoing?
    end_at.nil?
  end

  def ended?
    end_at.present?
  end

  def start!
    assign_attributes user: card.user unless user
    assign_attributes start_at: Time.now
    save!
  end

  def end!
    update! end_at: Time.now
  end

  def now_or_end_at
    ended? ? end_at : Time.now
  end

  def duration
    now_or_end_at - start_at
  end
end
