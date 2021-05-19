class Occupant < ApplicationRecord
  has_many :contracts
  has_many :units, through: :contracts, inverse_of: :occupants
end