class User < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :card_sessions, dependent: :destroy
  validates :id_hex, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true, format: { with: /\A[0-9A-Za-z_]+\z/ }

  after_initialize do |user|
    user.id_hex ||= SecureRandom.hex(8)
    user.salt ||= SecureRandom.alphanumeric(32)
  end

  def ongoing_session!
    @ongoing_session = card_sessions.ongoing.first
  end

  def ongoing_session
    @ongoing_session ||= ongoing_session!
  end

  def has_ongoing_session?
    ongoing_session.present?
  end

  def end_ongoing_session!
    ongoing_session.end! if ongoing_session
  end
end
