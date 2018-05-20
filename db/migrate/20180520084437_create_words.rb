class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.string :hanzi
      t.string :pinyin
      t.string :definition

      t.timestamps
    end
  end
end
