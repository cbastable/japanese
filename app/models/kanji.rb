# == Schema Information
#
# Table name: kanjis
#
#  id         :integer          not null, primary key
#  kanji      :string(255)
#  onyomi     :string(255)
#  kunyomi    :string(255)
#  english    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Kanji < ActiveRecord::Base
  attr_accessible :english, :kanji, :kunyomi, :onyomi

  has_many :lists, foreign_key: "kanji_id", dependent: :destroy
  has_many :collections, through: :lists
  has_many :words

  def in_collection?(collection)
  	lists.find_by_collection_id(collection.id)
  end

  def add_to_collection!(collection)
  	self.lists.create!(collection_id: collection.id)
  end

  def remove_from_collection!(collection)
  	self.lists.find_by_collection_id(collection.id).destroy
  end
end