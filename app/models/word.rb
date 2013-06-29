# == Schema Information
#
# Table name: words
#
#  id          :integer          not null, primary key
#  word        :text
#  reading     :text
#  translation :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Word < ActiveRecord::Base
  attr_accessible :reading, :translation, :word

  has_many :word_collections, foreign_key: "word_id", dependent: :destroy
  has_many :collections, through: :word_collections
  has_many :word_kanjis, foreign_key: "word_id", dependent: :destroy
  has_many :kanjis, through: :word_kanjis

end
