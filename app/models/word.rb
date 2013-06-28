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

  has_many :word_lists, foreign_key: "word_id", dependent: :destroy
  has_many :kanjis, through: :word_lists
end
