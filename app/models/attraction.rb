class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides

  validates :name, presence: true
  # validates :min_height, numericality: {}
  # validates :nausea_rating
  # validates :happiness_rating
  # validates :ticket_number

end
