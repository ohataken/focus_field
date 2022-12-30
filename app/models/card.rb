class Card < ApplicationRecord
  validates :id_hex, presence: true, uniqueness: true
  validates :name, presence: true
end
