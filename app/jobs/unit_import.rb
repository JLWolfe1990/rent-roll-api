require 'csv'

# this would usually be a background job but that is OoS
class UnitImport
  def perform(file_path)
    headers = false
    CSV.read(file_path).each do |row|
      unless headers
        headers = true
        next
      end

      unit = Unit.find_or_create_by(number: row[0], floor_plan: row[1])

      occupant = Occupant.find_or_create_by(name: row[2])

      move_in = Date.strptime(row[3], '%m/%d/%Y') if row[3]
      move_out = Date.strptime(row[4], '%m/%d/%Y') if row[4]

      Contract.find_or_create_by(unit: unit, occupant: occupant, move_in: move_in, move_out: move_out)
    end
  end
end