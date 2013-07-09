class WordsController < ApplicationController
	def show
		@collection = Collection.find_by_name(params[:collection])
    	@word = Word.find_by_word(params[:word])
	    @word_list = WordCollection.where(collection_id: @collection.id)
	    #@count = @word_list.count
	    @current = @word_list.find_by_word_id(@word.id).id
	    @next = @current - 1	#newest entries in DB are "first", to go back need to -1
	    @previous = @current + 1
	    if @next < @word_list.all.last.id || WordCollection.find(@next).collection_id != @collection.id
	      @next = @word_list.first
	    end
	    if @previous < @word_list.all.first.id || WordCollection.find(@previous).collection_id != @collection.id
	      @previous = @word_list.last
	    end
	    @previous_word = @word_list.find(@previous).word
	    @next_word = @word_list.find(@next).word
	    @count = 0
	    @current_number = 0
	    @word_list.each do |w|
	    	@count = @count + 1
	    	if w.word.word == @word.word
	    		@current_number = @count
	    	end
	    end
	    @first = @word_list.first.id #highest number
	    @last = @word_list.last.id #lowest number
	    #@current_number = @word_list.find_by_word_id(@word.id).id - @last + 1
	    #if @current_number < 1
	     # @current_number = @word_list.find_by_word_id(@word.id).id 
	    #end
 	end

  	def index
  		@collections = Collection.all
  	end

    def random
  		@collection = Collection.find_by_name(params[:collection])
	    @word_list = @collection.words
	    @word = @word_list.offset(rand(@word_list.count)).first
	    @current = WordCollection.where(collection_id: @collection.id, word_id: @word.id).first.id
	    @count = WordCollection.where(collection_id: @collection.id).count
	    @first = WordCollection.where(collection_id: @collection.id).all.first.id #highest number
	    @last = WordCollection.where(collection_id: @collection.id).all.last.id #lowest number
	    @current_number = WordCollection.where(collection_id: @collection.id, word_id: @word.id).first.id - @last + 1
	    if @current_number < 1
	      @current_number = WordCollection.where(collection_id: @collection.id, word_id: @word.id).first.id - @first + 1
	    end
  	end

    def test
	    @collection = Collection.find_by_name(params[:collection])
	    @word_list = @collection.words
	    @word = Word.find_by_word(params[:word])
	    @count = WordCollection.where(collection_id: @collection.id).count
	    @current = WordCollection.where(collection_id: @collection.id, word_id: @word.id).first.id
	    @next = @current + 1
	    if @next > @count || WordCollection.where(id: @next).first.collection_id != @collection.id
	      @next = WordCollection.where(collection_id: @collection.id).all.last.id
	    end
	    @next_word = Word.find_by_id(WordCollection.where(id: @next).first.word_id)
  	end
end
