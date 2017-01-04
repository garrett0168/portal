class Category < ActiveRecord::Base
  has_many :uploadable_items, inverse_of: :category, dependent: :nullify
  has_many :logos

  has_many :uploadable_items_subcategories, inverse_of: :category

  has_ancestry

  validates :name, presence: true

  def self.main_categories
    self.roots
  end

  # Rails admin
  rails_admin do
    nestable_tree({
      max_depth: 2
    })
    list do
      field :name
    end
    edit do
      include_fields :name 
    end
  end

end
