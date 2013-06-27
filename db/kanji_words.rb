#!/bin/env ruby
# encoding: utf-8

require 'rubygems'
require 'mechanize'


BASE_URL = 'http://jisho.org'
BASE_DIR = '/words?jap='

Dir.glob("data/jlpt5/*.txt") do |text_file|
  	puts "working on: #{text_file}..."
  	contents = File.read("#{text_file}")
	begin
		agent = Mechanize.new
		page = agent.get(BASE_URL+BASE_DIR+contents)

		words = page.search(".kanji")

		words.each do |w|
			if w.text().rstrip.length > 1
				word = w.text().rstrip.delete "#{contents}"
				Dir.glob("data/jlpt5/*.txt") do |comps|
					known_kanji = File.read("#{comps}")
					word = word.delete "#{known_kanji}"
				end #Dir
				size = word.length
				if size < 1
					puts w.text().rstrip	
				end
			end #if w.text().rstrip.length > 1
		end #words
	ensure
		sleep 1.0 + rand
	end #begin


end #Dir.glob