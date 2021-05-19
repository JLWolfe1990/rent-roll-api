class Unit < ApplicationRecord
  has_many :contracts
  has_many :occupants, through: :contracts, inverse_of: :units

  # I would typically have a lookup table for floor_plans or at least an enum
  validates :number, :floor_plan, presence: true

  def occupied_on?(date)
    contracts.where('move_in <= ? and move_out >= ?', date, date).present?
  end

  # Maybe we could find a better name
  def leased_on?(date)
    cur_contract = contracts.where('move_out <= ? or move_out is null', date)
    !(cur_contract.present? || cur_contract.detect { |contract| contract.is_effective_on?(date) })
  end

  def vacant_on?(date)
    !leased?
  end
end