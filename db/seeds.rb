# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Word.destroy_all
Character.destroy_all
VocabularyEntry.destroy_all
WordCharacter.destroy_all

puts "Prior entries destroyed"

raw_data = File.open('/home/jake/code/Personal Projects/Word Wang/db/cedict_ts.u8', 'r')



def clean_raw_data(data)
  lines = []
  data.each_line { |line|
    lines << line.sub!(/^.*?\s/, '')
  }
  lines
end

puts "Cleaning raw data"

lines = clean_raw_data(raw_data)

puts "Raw data cleaned"

puts "Organizing word data"

entries = lines.map { |entry|
  {
    hanzi: entry.match(/^.*?(?=\s)/)[0],
    pinyin: entry.match(/(?<=\[).*(?=\])/)[0],
    definition: entry.match(/(?<=\/).*(?=\/)/)[0]
  }
}

puts "Word data organized"

puts "Sorting single/multi-character words"

single_character_words = entries.select { |entry| entry[:hanzi].length == 1 }
multi_character_words = entries.reject { |entry| entry[:hanzi].length == 1 }

puts "Words sorted"

single_character_words.each do |word|
  Character.create(word)
  puts "Created #{Character.last.hanzi}"
end

multi_character_words.each do |word|
  Word.create(word)
  puts "Created #{Word.last.hanzi}"
end

Word.all.each do |word|
  characters = word[:hanzi].split('')
  characters.each do |character|
    char = Character.find_by(hanzi: character)
    unless char.nil?
      character_id = char.id
      word_id = word.id
      WordCharacter.create(word_id: word_id, character_id: character_id)
      puts "Created #{WordCharacter.count} word character associations"
    end
  end
end


puts "#{Word.count} words and #{Character.count} characters"
