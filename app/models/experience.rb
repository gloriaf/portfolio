class Experience < ActiveRecord::Base
  attr_accessible :desc, :framework, :info, :link, :name, :tools, :type, :year
  belongs_to :user
  
  default_scope order: ('experiences.year DESC, experiences.created_at DESC')
  
  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: true, length: { maximum: 140}
  validates :year, presence: true, numericality: { greater_than: 1970, less_than_or_equal_to: :year}
  
end
