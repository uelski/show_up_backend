class Band < ActiveRecord::Base
  has_secure_password
  has_many :shows, :through => :band_shows
  has_many :band_shows
  validates :band_name, presence: true, uniqueness: true
end
