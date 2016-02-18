class CreateSponsoredposts < ActiveRecord::Migration
  def change
    create_table :sponsoredposts do |t|
      t.string :title
      t.text :body
      t.integer :price, default: 100

      t.timestamps null: false
    end
  end
end
