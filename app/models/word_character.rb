class WordCharacter < ApplicationRecord
  belongs_to :word
  belongs_to :character
end
