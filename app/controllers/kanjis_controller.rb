class KanjisController < ApplicationController
  def show
    @collection = Collection.find_by_name(params[:collection])
    @kanji = Kanji.find_by_kanji(params[:kanji])
    @collection ||= @kanji.collections.first
    @kanji_list = List.where(collection_id: @collection.id).order("id DESC")
    @count = @kanji_list.count
    @current = @kanji_list.find_by_kanji_id(@kanji.id).id
    @next = @current - 1
    @previous = @current + 1
    if @next < @kanji_list.all.last.id || List.find(@next).collection_id != @collection.id
      @next = @kanji_list.first.id
    end
    if @previous > @kanji_list.all.first.id || List.find(@previous).collection_id != @collection.id
      @previous = @kanji_list.last.id
    end
    @previous_kanji = @kanji_list.find(@previous).kanji
    @next_kanji = @kanji_list.find(@next).kanji
    @current_number = @kanji_list.first.id - @current + 1
    @first = @kanji_list.first.id #highest number, most recent entry
    @last = @kanji_list.last.id #lowest number, oldest entry
  end

  def index
    @collection = Collection.find_by_name(params[:id])
  	@kanjis = @collection.kanjis
  end

end