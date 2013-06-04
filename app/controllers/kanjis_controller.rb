class KanjisController < ApplicationController
  def show
  	if Kanji.find_by_kanji(params[:kanji])
  		@kanji = Kanji.find_by_kanji(params[:kanji])
  	else
  		@kanji = Kanji.find(params[:id])
  	end
  	
  	
  end

  def index
  	@kanjis = Kanji.all
  end
end
