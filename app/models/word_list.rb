# == Schema Information
#
# Table name: word_lists
#
#  id         :integer          not null, primary key
#  kanji_id   :integer
#  word_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WordList < ActiveRecord::Base
  attr_accessible :kanji_id, :word_id

  belongs_to :kanji
  belongs_to :word

  validates :kanji_id, presence: true
  validates :word_id, presence: true
end
