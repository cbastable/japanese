class KanjisController < ApplicationController
  def show
    @collection = Collection.find_by_name(params[:collection])
    @kanji = Kanji.find_by_kanji(params[:kanji])
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