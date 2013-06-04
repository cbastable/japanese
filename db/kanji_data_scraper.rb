require 'rubygems'
require 'mechanize'


BASE_URL = 'http://jisho.org'
BASE_DIR = '/kanji/details/'

Dir.glob("data/jlpt5/*.txt") do |my_text_file|
  puts "working on: #{my_text_file}..."
  contents = File.read("#{my_text_file}")

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

end #Dir.glob

