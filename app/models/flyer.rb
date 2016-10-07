class Flyer < ActiveRecord::Base
  belongs_to :user, inverse_of: :flyers
  belongs_to :category, inverse_of: :flyers

  has_many :flyers_subcategories, inverse_of: :flyer, dependent: :destroy
  has_many :additional_categories, through: :flyers_subcategories, class_name: "Category", source: :category

  validates :category, :title, :document, presence: true

  accepts_nested_attributes_for :flyers_subcategories, allow_destroy: true

  has_attached_file :document, styles: { medium: ["300x300>", :png], thumb: "126x138>", large: ["800x1035>", :png] }, :convert_options => { :all => '-alpha remove -background white' }
  validates_attachment :document, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}

end
