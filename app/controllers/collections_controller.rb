class CollectionsController < ApplicationController
  def index
  	@collections = Collection.first(4)
    #JLPT1 kanji list having some weird issues with ordering. Also this code
    #all runs terribly slowly & non-optimized. Working with 1.2k Kanji at once
    #breaks things. Can be fixed with some brain power.
  end

  def show
  	@collection = Collection.find_by_name(params[:id])
  	@kanji_list = List.where(collection_id: @collection.id)
    @kanji = @kanji_list.first
    @test_kanji = @kanji_list.first
    #@kanji = @kanji_list.first
  end

  def words
    @collection = Collection.find_by_name(params[:collection])
    @word_list = WordCollection.where(collection_id: @collection.id)
    @word = @word_list.first
    @test_word = @word_list.offset(rand(@word_list.count)).first
  end

  def random
    @collection = Collection.find_by_name(params[:id])
    @kanji_list = List.where(collection_id: @collection.id)
    @kanji = @kanji_list.offset(rand(@kanji_list.count)).first
    @first = @kanji_list.first.id #highest number
    @last = @kanji_list.last.id #lowest number
    @count = 0
    @current_number = 0
    @kanji_list.each do |k|
      @count = @count + 1
      @current_number = @count if k.kanji.kanji == @kanji.kanji.kanji
    end
  end

  def test
    #@test = Kanji.new
    @collection = Collection.find_by_name(params[:collection])
    @kanji_list = @collection.kanjis
    @kanji = Kanji.find_by_kanji(params[:kanji])
    @current = List.where(collection_id: @collection.id, kanji_id: @kanji.id).first.id
    @count = List.where(collection_id: @collection.id).count
    @next = @current + 1
    if @next > @count || List.where(id: @next).first.collection_id != @collection.id
      @next = List.where(collection_id: @collection.id).all.last.id
    end
    @next_kanji = Kanji.find_by_id(List.where(id: @next).first.kanji_id)
  end


  def kanjis  
  end

end