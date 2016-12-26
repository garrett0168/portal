class RenameFlyersAndMakeItGeneric < ActiveRecord::Migration
  def up
    rename_table :flyers, :uploadable_items
    add_column :uploadable_items, :type, :string

    rename_table :flyers_subcategories, :uploadable_items_subcategories
    rename_column :uploadable_items_subcategories, :flyer_id, :uploadable_item_id

    UploadableItem.reset_column_information
    UploadableItem.update_all(type: "Flyer")
  end

  def down
    rename_column :uploadable_items_subcategories, :uploadable_item_id, :flyer_id
    rename_table :uploadable_items_subcategories, :flyers_subcategories

    remove_column :uploadable_items, :type
    rename_table :uploadable_items, :flyers
  end
end
