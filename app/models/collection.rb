# == Schema Information
#
# Table name: collections
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Collection < ActiveRecord::Base
  attr_accessible :name

  has_many :lists, foreign_key: "collection_id", dependent: :destroy
  has_many :kanjis, through: :lists
  has_many :word_collections, foreign_key: "collection_id", dependent: :destroy
  has_many :words, through: :word_collections
end
