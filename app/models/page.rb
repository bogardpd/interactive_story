class Page < ActiveRecord::Base
  validates :page_num, presence: true, uniqueness: true
  validates :story_text, presence: true
  validates :choice_1, presence: true, length: { maximum: 255 }
  validates :choice_2, presence: true, length: { maximum: 255 }
  validates :nickname, presence: true, length: { maximum: 50 }
end
