class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :description
      t.string :price
      t.string :image
      t.string :status
      t.integer :category_id
      t.integer :seller_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end
