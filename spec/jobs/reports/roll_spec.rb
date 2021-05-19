require 'rails_helper'

describe 'Reports::Roll', report: true do
  # Factories OoS
  let(:unit) { Unit.create(number: '1A', floor_plan: 'suite') }
  let(:occupant) { Occupant.create(name: 'Bobbie Burrito' ) }
  let(:contract) { nil }

  context 'when there is an unoccupied unit' do
    before { unit }

    it_should_behave_like 'a leased unit'
  end

  context 'when there is an occupied unit' do
    let(:move_in) { 1.week.ago }
    let(:move_out) { 1.week.ago }
    let(:contract) { Contract.create(move_in: move_in, move_out: move_out, occupant: occupant, unit: unit) }

    before { contract }

    context 'when the occupants are moving in today' do
      let(:move_in) { Date.today }

      it_should_behave_like 'a leased unit'
    end

    context 'when the occupants are moving out today' do
      let(:move_out) { Date.today }

      it_should_behave_like 'a leased unit'
    end
  end

  context 'when a unit is preleased' do
    let(:contract) { Contract.create(occupant: occupant, unit: unit)}

    it_should_behave_like 'a leased unit'
  end
end