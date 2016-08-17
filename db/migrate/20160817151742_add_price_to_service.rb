class AddPriceToService < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :price, :string
  end
end
