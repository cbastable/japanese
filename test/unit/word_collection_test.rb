# == Schema Information
#
# Table name: word_collections
#
#  id            :integer          not null, primary key
#  collection_id :integer
#  word_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class WordCollectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
