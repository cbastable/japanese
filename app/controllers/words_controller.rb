class WordsController < ApplicationController
	def show
		@collection = Collection.find_by_name(params[:collection])
    	@word = Word.find_by_word(params[:word])
	    @word_list = @collection.kanjis
	    @current = WordCollection.where(collection_id: @collection.id, word_id: @word.id).first.id
	    @count = WordCollection.where(collection_id: @collection.id).count
	    @next = @current + 1
	    @previous = @current - 1
	    if @next > @count || WordCollection.where(id: @next).first.collection_id != @collection.id
	      @next = WordCollection.where(collection_id: @collection.id).all.last.id
	    end
	    #if @previous < 1 || WordCollection.where(id: @previous).first.collection_id != @collection.id
	     # @previous = WordCollection.where(collection_id: @collection.id).all.first.id
	    #end
	    #@previous_word = Word.find_by_id(WordCollection.where(id: @previous).first.word_id)
	    @next_word = Word.find_by_id(WordCollection.where(id: @next).first.word_id)
	    
	    @first = WordCollection.where(collection_id: @collection.id).all.first.id #highest number
	    @last = WordCollection.where(collection_id: @collection.id).all.last.id #lowest number
	    @current_number = WordCollection.where(collection_id: @collection.id, word_id: @word.id).first.id - @last + 1
	    #janky fix for current number going negative on JLPT1
	    if @current_number < 1
	      @current_number = WordCollection.where(collection_id: @collection.id, word_id: @word.id).first.id - @first + 1
	    end
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
