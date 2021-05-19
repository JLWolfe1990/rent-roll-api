require 'rails_helper'

RSpec.shared_examples_for 'a leased unit' do
  it 'should include the unit in the the report' do

    [
      [
        unit.number,
        unit.floor_plan,
        occupant&.name,
        contract&.move_in,
        contract&.move_out,
      ]
    ]
  end
end
