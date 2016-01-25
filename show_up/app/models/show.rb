class Show < ActiveRecord::Base
  has_many :bands, :through => :band_shows
  has_many :band_shows
  belongs_to :venue
end
