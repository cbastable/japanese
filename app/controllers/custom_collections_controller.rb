class CustomCollectionsController < ApplicationController
	def index
	  	@custom_collections = current_user.custom_collections.all
	end

	def show
		@user = current_user
	  	@collection = Collection.find_by_name(params[:id])
	  	@kanji_list = List.where(collection_id: @collection.id).order("id DESC")
	    @kanji = @kanji_list.first
	    @test_kanji = @kanji_list.first
	    #@kanji = @kanji_list.first
	end


end
