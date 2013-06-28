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

require 'test_helper'

class WordListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
