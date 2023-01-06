class User < ApplicationRecord
  attr_accessor :password

  has_many :cards, dependent: :destroy
  has_many :card_sessions, dependent: :destroy
  validates :id_hex, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true, format: { with: /\A[0-9A-Za-z_]+\z/ }
  validates :password, length: { in: 8..32 }, if: :new_record?

  after_initialize do |user|
    user.id_hex ||= SecureRandom.hex(8)
    user.salt ||= SecureRandom.alphanumeric(32)
  end

  before_validation do |user|
    user.crypted_password = crypto_password_with_salt if user.password
  end

  def crypto_password_with_salt
    Digest::SHA512.hexdigest(password + salt)
  end

  def match_password?
    crypted_password == crypto_password_with_salt
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
