class CreateVocabularyEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :vocabulary_entries do |t|
      t.references :user, foreign_key: true
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
