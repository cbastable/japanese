# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ruby encoding: utf-8

Kanji.delete_all

Dir.foreach('/data/jlpt5') do |file|
  next if file == '.' or file == '..'
  # do work on real items
  contents = File.read('file')
  Kanji.create!(name: )
end