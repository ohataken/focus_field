class Card < ApplicationRecord
  belongs_to :user
  validates :id_hex, presence: true, uniqueness: true
  validates :name, presence: true

  after_initialize do |user|
    user.id_hex ||= SecureRandom.hex(16)
  end
end
