namespace :db do
  desc "Fill database with jlpt data"
  task populate: :environment do
    make_collections
    make_lists
  end
end

def make_collections
  Collection.destroy_all
  jlpt5 = Collection.create!(name: "jlpt5")
  jlpt4 = Collection.create!(name: "jlpt4")
  jlpt3 = Collection.create!(name: "jlpt3")
  jlpt2 = Collection.create!(name: "jlpt2")
  jlpt1 = Collection.create!(name: "jlpt1")
  puts "Collections created"
end

def make_lists
  List.destroy_all
  Collection.all.each do |collection|
    Dir.glob("db/data/#{collection.name}/*.txt") do |my_text_file|
      puts "working on: #{collection.name} & #{my_text_file}..."
      contents = File.read("#{my_text_file}")
      kanji = Kanji.find_by_kanji(contents)
      List.create!(kanji_id: kanji.id, collection_id: collection.id)
      puts "Added #{contents} to #{collection.name}"
    end #Dir.glob
  end #Collection.all.each do
end #make_lists
