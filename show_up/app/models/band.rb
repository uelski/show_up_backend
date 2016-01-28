class Band < ActiveRecord::Base
  has_secure_password
  has_many :shows, :through => :band_shows
  has_many :band_shows
  validates :band_name, presence: true, uniqueness: true

  def self.find_by_credentials(band_name, password)
    band = Band.find_by(band_name: band_name)
    if band && band.authenticate(password)
      return band
    else
      return nil
    end
  end
end
