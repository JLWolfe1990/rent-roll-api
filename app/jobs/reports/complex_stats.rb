module Reports
  class ComplexStats
    def perform(date)
      vacant_count = 0
      occupied_count = 0
      leased_count = 0

      Unit.includes(:contracts).find_each do |unit|
        vacant_count += 1 if unit.vacant_on(date)
        occupied_count += 1 if unit.occupied_on(date)
        leased_count += 1 if unit.leased_on(date)
      end

      [vacant_count, occupied_count, leased_count]
    end
  end
end