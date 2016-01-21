class Show < ActiveRecord::Base
  has_and_belongs_to_many :bands
  belongs_to :venue
end
