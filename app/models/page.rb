class Page < ActiveRecord::Base
  validates :page_num, presence: true, uniqueness: true
  validates :story_text, presence: true
  validates :choice_1, presence: true
  validates :choice_2, presence: true
end
