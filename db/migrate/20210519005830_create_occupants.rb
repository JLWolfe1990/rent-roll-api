class CreateOccupants < ActiveRecord::Migration[6.0]
  def change
    create_table :occupants do |t|
      t.string :name
    end
  end
end
