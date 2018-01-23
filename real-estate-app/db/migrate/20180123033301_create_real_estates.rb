class CreateRealEstates < ActiveRecord::Migration[5.1]
  def change
    create_table :real_estates do |t|
      t.text :description
      t.integer :year_built
      t.integer :square_feet
      t.integer :bedrooms
      t.integer :bathrooms
      t.string :floors
      t.string :availability
      t.integer :price

      t.timestamps
    end
  end
end
