class WordsController < ApplicationController
	def show
		@collection = Collection.find_by_name(params[:collection])
    	@word = Word.find_by_word(params[:word])
	    @word_list = WordCollection.where(collection_id: @collection.id).order("id DESC")
	    @count = @word_list.count
	    @current = @word_list.find_by_word_id(@word.id).id
	    @next = @current - 1	#newest entries in DB are "first", to go back need to -1
	    @previous = @current + 1
	    if @next < @word_list.all.last.id || WordCollection.find(@next).collection_id != @collection.id
	      @next = @word_list.first.id
	    end
	    if @previous > @word_list.all.first.id || WordCollection.find(@previous).collection_id != @collection.id
	      @previous = @word_list.last.id
	    end
	    @previous_word = @word_list.find(@previous).word
	    @next_word = @word_list.find(@next).word
	    @current_number = @word_list.first.id - @current + 1
	    @first = @word_list.first.id #highest number
	    @last = @word_list.last.id #lowest number
 	end

  	def index
  		@collections = Collection.all
  	end

    def random
  		@collection = Collection.find_by_name(params[:collection])
	    @word_list = WordCollection.where(collection_id: @collection.id).order("id DESC")
	    @count = @word_list.count
	    @word = @word_list[(rand(@count))].word
	    @current = @word_list.find_by_word_id(@word.id).id
    	@current_number = @word_list.first.id - @current + 1
	    if @current_number < 1
	      @current_number = WordCollection.where(collection_id: @collection.id, word_id: @word.id).first.id - @first + 1
	    end
  	end

    def test
	    @collection = Collection.find_by_name(params[:collection])
	    @word = Word.find_by_word(params[:word])
	    @word_list = WordCollection.where(collection_id: @collection.id).order("id DESC")
	    @count = @word_list.count
	    @current = @word_list.find_by_word_id(@word.id).id
	    @next = @current - 1
	    if @next < @word_list.all.last.id || WordCollection.find(@next).collection_id != @collection.id
	      @next = @word_list.first.id
	    end
	    @next_word = @word_list.find(@next).word
  	end
end
