class AddCategoryIdToFlyers < ActiveRecord::Migration
  def change
    add_column :flyers, :category_id, :integer
  end
end
