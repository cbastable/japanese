class StaticPagesController < ApplicationController

def home
	@kanji = Kanji.offset(rand(Kanji.count)).first
end

def show
	
end

end
