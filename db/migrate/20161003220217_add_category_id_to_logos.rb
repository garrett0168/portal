class AddCategoryIdToLogos < ActiveRecord::Migration
  def change
    add_column :logos, :category_id, :integer
  end
end
