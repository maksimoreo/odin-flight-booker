class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.references :from_airport, null: false, foreign_key: { to_table: :airports }
      t.references :to_airport, null: false, foreign_key: { to_table: :airports }
      t.datetime :start
      t.integer :duration

      t.timestamps
    end
  end
end
