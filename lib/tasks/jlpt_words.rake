namespace :db do
  desc "Fill database with jlpt word data"
  task populate_word_links: :environment do
    make_word_collections
    make_word_kanjis
  end
end


def make_word_collections
  WordCollection.destroy_all
  Word.last(1).each do |w|  ##CHANGE TO Word.all later
    Collection.all.each do |collection|
      puts "working on: #{collection.name} | #{w.word}..."
      test_word = w.word
      Dir.glob("db/data/#{collection.name}/*.txt") do |my_text_file|
        contents = File.read("#{my_text_file}")
        kanji = Kanji.find_by_kanji(contents)
        test_word = test_word.delete "#{kanji.kanji}"
        puts "deleted #{kanji.kanji} if existed in #{w.word}"
      end #Dir.glob
      size = test_word.length
      if size < 1
         WordCollection.create!(word_id: w.id, collection_id: collection.id)
         puts "WordCollection created successfully: #{collection.name} | #{w.word}"
      end
    end #collection.all.each
  end #Word.all.each
end #make_word_lists

def make_word_kanjis
  WordKanji.destroy_all
  Collection.all.each do |collection|
    collection.words.all.each do |w|
      Dir.glob("db/data/#{collection.name}/*.txt") do |my_text_file|
        puts "working on: #{collection.name} & #{my_text_file}..."
        contents = File.read("#{my_text_file}")
        kanji = Kanji.find_by_kanji(contents)
        WordKanji.create!(kanji_id: kanji.id, word_id: w.id) if w.word.include? kanji.kanji
      end #Dir.glob
    end #collection.words.all.each
  end #collection.all.each
end #make_word_lists