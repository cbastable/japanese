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

  
end
