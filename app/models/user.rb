class User < ApplicationRecord
  validates :id_hex, presence: true, uniqueness: true
end
