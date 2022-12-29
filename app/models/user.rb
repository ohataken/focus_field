class User < ApplicationRecord
  validates :id_hex, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true, format: { with: /\A[0-9A-Za-z_]+\z/ }

  after_initialize do |user|
    user.id_hex ||= SecureRandom.hex(8)
  end
end
