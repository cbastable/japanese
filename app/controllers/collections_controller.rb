class CollectionsController < ApplicationController
  def index
  	@collections = Collection.all
  end

  def show
  	@collection = Collection.find_by_name(params[:id])
  	@kanji_list = @collection.kanjis
    @kanji = List.where(collection_id: @collection.id).all.first.kanji
    #@kanji = @kanji_list.first
  end

  def kanjis	
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


end