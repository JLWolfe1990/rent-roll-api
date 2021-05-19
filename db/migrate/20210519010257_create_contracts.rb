class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.belongs_to :occupant, null: false, foreign_key: true
      t.belongs_to :unit, null: false, foreign_key: true
      t.date :move_in
      t.date :move_out
    end
  end
end
