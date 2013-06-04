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

require 'test_helper'

class KanjiTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
