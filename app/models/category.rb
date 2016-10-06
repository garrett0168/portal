class Category < ActiveRecord::Base
  has_many :flyers, inverse_of: :category, dependent: :nullify
  has_many :logos

  has_many :flyers_subcategories, inverse_of: :flyer

  has_ancestry

  def self.main_categories
    self.roots
  end

end
