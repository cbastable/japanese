class WordsController < ApplicationController
	def show
    	@word = Word.last
 	end

  def index
  	@words = Word.first(100)
  end
end
