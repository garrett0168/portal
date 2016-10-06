class CreateFlyersSubcategories < ActiveRecord::Migration
  def change
    create_table :flyers_subcategories do |t|
      t.references :flyer, null: false, index: true
      t.references :category, null: false, index: true

      t.timestamps
    end
  end
end
