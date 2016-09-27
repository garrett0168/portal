class CreateFlyers < ActiveRecord::Migration
  def change
    create_table :flyers do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
