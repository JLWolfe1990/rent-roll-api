class Contract < ApplicationRecord
  belongs_to :unit
  belongs_to :occupant # I would usually many that a 'has_many' but this prompt...

  scope :occupied_on, -> (date) { where('move_in <= ? and (move_out is NULL or move_out >= ?)', date, date) }

  def is_effective_on?(date)
    move_in.blank? ||
      move_out.blank? ||
      move_in <= date && move_out >= date
  end
end