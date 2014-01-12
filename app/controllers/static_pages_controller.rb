class StaticPagesController < ApplicationController

def home
	@collection = Collection.first(order: "RANDOM()")
    @kanji_list = List.where(collection_id: @collection.id).order("id DESC")
    @count = @kanji_list.count
    @kanji = @kanji_list[(rand(@count))].kanji
    @onyomi = @kanji.onyomi
    @kunyomi = @kanji.kunyomi.split(",")
    @kunyomi_furigana = []
    @kunyomi_okurigana = []
    @kanji.kunyomi.split(",").each do |kun|
      @kunyomi_furigana << kun.strip.split(".").first
      if @kunyomi_furigana.last == kun.strip.split(".").last
        @kunyomi_okurigana << ""
      else
        @kunyomi_okurigana << kun.strip.split(".").last 
      end
    end
end

def show
end

def comingsoon
end

def thanksto
end

end
