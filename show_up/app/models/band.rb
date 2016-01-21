class Band < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :shows
  validates :band_name, presence: true, uniqueness: true
end
