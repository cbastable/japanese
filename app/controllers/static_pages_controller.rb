class StaticPagesController < ApplicationController

def home
	@kanji = Kanji.offset(rand(Kanji.count)).first
	@collection = Collection.find(List.where(kanji_id: @kanji.id).first.collection_id)
end

def show
	
end

end
