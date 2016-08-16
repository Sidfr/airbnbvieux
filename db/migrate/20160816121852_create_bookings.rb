class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :service, foreign_key: true
      t.datetime :startdate
      t.datetime :enddate
      t.boolean :validated_booking

      t.timestamps
    end
  end
end
