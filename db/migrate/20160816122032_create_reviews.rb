class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :description
      t.string :stars
      t.references :sender
      t.references :recipient

      t.timestamps
    end
  end
end
