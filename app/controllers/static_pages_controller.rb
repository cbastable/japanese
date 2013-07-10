class StaticPagesController < ApplicationController

def home
	@collection = Collection.first(order: "RANDOM()")
    @kanji_list = List.where(collection_id: @collection.id).order("id DESC")
    @count = @kanji_list.count
    @kanji = @kanji_list[(rand(@count))].kanji
end

def show
end

def comingsoon
end

def thanksto
end

end
