module Reports
  class Roll
    def perform(date)
      report = []

      Unit.includes(:contracts, :occupants).find_each do |unit|
        contract = unit.contracts.occupied_on(date).last
        occupant = contract&.occupant
        report << [
          unit.number,
          unit.floor_plan,
          occupant&.name,
          contract&.move_in,
          contract&.move_out,
        ]
      end

      report
    end
  end
end