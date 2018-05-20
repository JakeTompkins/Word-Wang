class Character < ApplicationRecord
  has_many :word_characters
  has_many :words, through: :word_characters
end
