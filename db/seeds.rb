# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ruby encoding: utf-8
require 'rubygems'
require 'mechanize'

Kanji.destroy_all

BASE_URL = 'http://jisho.org'
BASE_DIR = '/kanji/details/'

Dir.glob("db/data/**/*.txt") do |my_text_file|
	puts "working on: #{my_text_file}..."
	contents = File.read("#{my_text_file}")
begin
	agent = Mechanize.new
	page = agent.get(BASE_URL+BASE_DIR+contents)

	readings = page.parser.xpath('//div[@class="japanese_readings"]').to_html.split('br')
	kunyomi = ""
	Nokogiri::HTML(readings[0]).css('a').each do |reading|
		if kunyomi == ""
			kunyomi = reading.text
		else
			kunyomi = kunyomi + ", " + reading.text
		end
	end
	onyomi = ""
	Nokogiri::HTML(readings[1]).css('a').each do |reading|
		if onyomi == ""
			onyomi = reading.text
		else
			onyomi = onyomi + ", " + reading.text
		end
	end

	english = page.parser.xpath('//div[@class="english_meanings"]//p').to_html.split('br')
	translation = ""
	english.each do |e|
		if translation == ""
			translation = Nokogiri::HTML(e).text.gsub(/[^0-9a-z ]/i, '')
		else
			translation = translation + ", " + Nokogiri::HTML(e).text.gsub(/[^0-9a-z ]/i, '')
		end
		#translation = translation + Nokogiri::HTML(e).text.gsub(/\W+/, '')
		translation.rstrip!
	end

	Kanji.create!(kanji: contents, onyomi: onyomi, kunyomi: kunyomi, english: translation)
	puts "Successfully created kanji"
 ensure
        sleep 1.0 + rand
 end  # done: begin

end #Dir.glob
