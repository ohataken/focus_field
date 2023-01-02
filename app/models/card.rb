class Card < ApplicationRecord
  belongs_to :user
  has_many :sessions, class_name: "CardSession", foreign_key: :card_id, dependent: :destroy
  validates :id_hex, presence: true, uniqueness: true
  validates :name, presence: true

  scope :order_by_created_at_desc, -> { order(created_at: :desc) }
  scope :finished, -> { where.not(finished_at: nil) }
  scope :unfinished, -> { where(finished_at: nil) }

  after_initialize do |user|
    user.id_hex ||= SecureRandom.hex(16)
  end

  def finished?
    finished_at.present?
  end

  def create_image
    RubyIdenticon.create id_hex
  end

  def image_filename
    "card_image_#{id_hex}"
  end

  def ongoing_session!
    @ongoing_session = sessions.ongoing.first
  end

  def ongoing_session
    @ongoing_session ||= ongoing_session!
  end

  def has_ongoing_session?
    ongoing_session.present?
  end

  def start_session!
    session = user.ongoing_session
    session = sessions.build.start! unless session
    ongoing_session!
  end
end
