require 'rubygems'
require 'mechanize'

DATA_DIR = "data/jlpt5"
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)

agent = Mechanize.new

page = agent.get('http://www.tanos.co.uk/jlpt/jlpt5/kanji/')
rows = page.search('table')[1].search('tr')

rows[1..-2].each do |row|
	content = row.search('td')[0].text.strip
	local_fname = "#{DATA_DIR}/#{content}.txt"
	unless File.exists?(local_fname)
		#File.open with 'w' opens/wipes a blank file for writing, 'a' for appending, 'r' for reading
		File.open(local_fname, 'w'){|file| file.write(content)}
        puts "\t...Success, saved to #{local_fname}"
	end
end