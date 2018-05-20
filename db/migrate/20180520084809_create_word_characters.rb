class CreateWordCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :word_characters do |t|
      t.references :word, foreign_key: true
      t.references :character, foreign_key: true

      t.timestamps
    end
  end
end
