class CollectionsController < ApplicationController
  def index
  	@collections = Collection.all
    #JLPT1 kanji list having some weird issues with ordering. Also this code
    #all runs terribly slowly & non-optimized. Working with 1.2k Kanji at once
    #breaks things. Can be fixed with some brain power.
  end

  def show
  	@collection = Collection.find_by_name(params[:id])
  	@kanji_list = List.where(collection_id: @collection.id).order("id DESC")
    @kanji = @kanji_list.first
    @test_kanji = @kanji_list.first
    #@kanji = @kanji_list.first
  end

  def words
    @collection = Collection.find_by_name(params[:collection])
    @word_list = WordCollection.where(collection_id: @collection.id).order("id DESC")
    @word = @word_list.first
    @test_word = @word_list.offset(rand(@word_list.count)).first
  end

  def random
    @collection = Collection.find_by_name(params[:id])
    @kanji_list = List.where(collection_id: @collection.id).order("id DESC")
    @count = @kanji_list.count
    @kanji = @kanji_list[(rand(@count))]
    @current = @kanji_list.find_by_kanji_id(@kanji.kanji.id).id
    @current_number = @kanji_list.first.id - @current + 1
  end

  def test
    #@test = Kanji.new
    @collection = Collection.find_by_name(params[:collection])
    @kanji = Kanji.find_by_kanji(params[:kanji])
    @onyomi = @kanji.onyomi
    @kunyomi = @kanji.kunyomi.split(",")
    @kunyomi_furigana = []
    @kunyomi_okurigana = []
    @kunyomi.each do |kun|
      @kunyomi_furigana << kun.strip.split(".").first
      if @kunyomi_furigana.last == kun.strip.split(".").last
        @kunyomi_okurigana << ""
      else
        @kunyomi_okurigana << kun.strip.split(".").last 
      end
    end
    @kanji_list = List.where(collection_id: @collection.id).order("id DESC")
    @current = @kanji_list.find_by_kanji_id(@kanji.id).id
    @count = @kanji_list.count
    @next = @current - 1
    if @next < @kanji_list.all.last.id || List.find(@next).collection_id != @collection.id
      @next = @kanji_list.first.id
    end
    @next_kanji = @kanji_list.find(@next).kanji
  end


  def kanjis  
  end

end