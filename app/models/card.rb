class Card < ApplicationRecord
  belongs_to :user
  validates :id_hex, presence: true, uniqueness: true
  validates :name, presence: true

  scope :order_by_created_at_desc, -> { order(created_at: :desc) }
  scope :finished, -> { where.not(finished_at: nil) }

  after_initialize do |user|
    user.id_hex ||= SecureRandom.hex(16)
  end

  def finished?
    finished_at.present?
  end
end
