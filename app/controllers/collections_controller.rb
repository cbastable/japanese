class CollectionsController < ApplicationController
  def index
  	@collections = Collection.all
  end

  def show
  	@collection = Collection.find_by_name(params[:id])
  	@kanji_list = @collection.kanjis
    @kanji = List.where(collection_id: @collection.id).all.first.kanji
    @test_kanji = @kanji_list.offset(rand(@kanji_list.count)).first
    #@kanji = @kanji_list.first
  end

  def words
    @collection = Collection.find_by_name(params[:collection])
    @word_list = @collection.words
    @word = @word_list.first
    @test_word = @word_list.offset(rand(@word_list.count)).first
  end

  def random
    @collection = Collection.find_by_name(params[:id])
    @kanji_list = @collection.kanjis
    @kanji = @kanji_list.offset(rand(@kanji_list.count)).first
    @count = List.where(collection_id: @collection.id).count
    @first = List.where(collection_id: @collection.id).all.first.id #highest number
    @last = List.where(collection_id: @collection.id).all.last.id #lowest number
    @current_number = List.where(collection_id: @collection.id, kanji_id: @kanji.id).first.id - @last + 1
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