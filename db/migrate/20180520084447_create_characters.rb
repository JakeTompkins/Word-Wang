class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :hanzi
      t.string :pinyin
      t.string :definition

      t.timestamps
    end
  end
end
