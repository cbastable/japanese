class KanjisController < ApplicationController
  def show
    @collection = Collection.find_by_name(params[:collection])
    @kanji = Kanji.find_by_kanji(params[:kanji])
    #@count = List.where(collection_id: @collection.id).count
    @kanji_list = List.where(collection_id: @collection.id)
    @current = @kanji_list.find_by_kanji_id(@kanji.id).id
    @next = @current - 1
    @previous = @current + 1
    if @next < @kanji_list.all.last.id || List.find(@next).collection_id != @collection.id
      @next = @kanji_list.first
    end
    if @previous > @kanji_list.all.first.id || List.find(@previous).collection_id != @collection.id
      @previous = @kanji_list.last
    end
    @previous_kanji = @kanji_list.find(@previous).kanji
    @next_kanji = @kanji_list.find(@next).kanji
    @count = 0
    @current_number = 0
    @kanji_list.each do |k|
      @count = @count + 1
      @current_number = @count if k.kanji.kanji == @kanji.kanji
    end
    @first = @kanji_list.first.id #highest number, most recent entry
    @last = @kanji_list.last.id #lowest number, oldest entry
  end

  def index
    @collection = Collection.find_by_name(params[:id])
  	@kanjis = @collection.kanjis
  end

end