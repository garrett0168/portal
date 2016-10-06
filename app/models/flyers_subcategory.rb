class FlyersSubcategory < ActiveRecord::Base
  belongs_to :flyer, inverse_of: :flyers_subcategories
  belongs_to :category, inverse_of: :flyers_subcategories

  validates :flyer, :category, presence: true

end
