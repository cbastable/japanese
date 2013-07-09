namespace :db do
  desc "Fill database with jlpt word data"
  task populate_word_links: :environment do
    make_word_collections
    make_word_kanjis
  end
end

def make_word_collections
  WordCollection.destroy_all
    Collection.all.each do |collection|
      data_dir = "#{Dir.pwd}/db/data/#{collection.name}/words"
      Dir.glob("#{data_dir}/*.txt") do |my_text_file|
        puts "working on: #{collection.name} & #{my_text_file}..."
        contents = File.read("#{my_text_file}")
        word = Word.find_by_word(contents)
        WordCollection.create!(word_id: word.id, collection_id: collection.id)
        puts "Added #{contents} to #{collection.name}"
      end #Dir.glob
    end #collection.all.each
end #make_word_lists

def make_word_kanjis
  WordKanji.destroy_all
  Collection.all.each do |collection|
    collection.words.all.each do |w|
      puts "wordking on: #{collection.name} | #{w.word}"
      Dir.glob("db/data/#{collection.name}/*.txt") do |my_text_file|
        puts "working on: #{collection.name} & #{my_text_file}..."
        contents = File.read("#{my_text_file}")
        kanji = Kanji.find_by_kanji(contents)
        WordKanji.create!(kanji_id: kanji.id, word_id: w.id) if w.word.include? kanji.kanji
      end #Dir.glob
    end #collection.words.all.each
  end #collection.all.each
end #make_word_lists