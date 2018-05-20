class Word < ApplicationRecord
  has_many :vocabulary_entries
  has_many :word_characters
  has_many :characters, through: :word_characters
end
