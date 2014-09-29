class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.integer :rating
      t.text :cuisine

      t.timestamps
    end
  end
end
