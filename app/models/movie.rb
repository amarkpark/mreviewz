class Movie < ActiveRecord::Base
  belongs_to :user
  validates_presence_of [:name, :release_year, :rating, :review]
  validates :rating, :inclusion => 0..5
  validates :release_year, :inclusion => 1905..Date.current.year
end
