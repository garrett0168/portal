class UploadableItemsSubcategory < ActiveRecord::Base
  belongs_to :uploadable_item, inverse_of: :uploadable_items_subcategories
  belongs_to :category, inverse_of: :uploadable_items_subcategories

  validates :uploadable_item, :category, presence: true

end
