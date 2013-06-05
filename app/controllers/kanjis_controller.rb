class KanjisController < ApplicationController
  def show
    @collection = Collection.find_by_name(params[:collection])
    @kanji_list = @collection.kanjis
    @kanji = Kanji.find_by_kanji(params[:kanji])
    @current = List.where(collection_id: @collection.id, kanji_id: @kanji.id).first.id
    @count = List.where(collection_id: @collection.id).count
    @next = @current + 1
    @previous = @current - 1
    if @next > @count || List.where(id: @next).first.collection_id != @collection.id
      @next = List.where(collection_id: @collection.id).all.last.id
    end
    if @previous < 1 || List.where(id: @previous).first.collection_id != @collection.id
      @previous = List.where(collection_id: @collection.id).all.first.id
    end
    @previous_kanji = Kanji.find_by_id(List.where(id: @previous).first.kanji_id)
    @next_kanji = Kanji.find_by_id(List.where(id: @next).first.kanji_id)
    #get {current_kanji}/{total no. kanji in set}
    
    @first = List.where(collection_id: @collection.id).all.first.id #highest number
    @last = List.where(collection_id: @collection.id).all.last.id #lowest number
    @current_number = List.where(collection_id: @collection.id, kanji_id: @kanji.id).first.id - @last + 1
    #janky fix for current number going negative on JLPT1
    if @current_number < 1
      @current_number = List.where(collection_id: @collection.id, kanji_id: @kanji.id).first.id - @first + 1
    end
  end

  def index
    @collection = Collection.find_by_name(params[:id])
  	@kanjis = @collection.kanjis
  end
end