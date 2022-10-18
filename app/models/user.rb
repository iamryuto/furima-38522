class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name_kanji, presence: true
  validates :first_name_kanji, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'

  KANJI_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates_format_of [:last_name_kanji, :first_name_kanji], with: KANJI_NAME_REGEX,
                                                             message: 'is invalid. Input full-width characters'

  KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates_format_of [:last_name_kana, :first_name_kana], with: KANA_NAME_REGEX,
                                                           message: 'is invalid. Input full-width katakana characters'
end
