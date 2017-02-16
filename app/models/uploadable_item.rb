class UploadableItem < ActiveRecord::Base
  belongs_to :user, inverse_of: :uploadable_items
  belongs_to :category, inverse_of: :uploadable_items

  has_many :uploadable_items_subcategories, inverse_of: :uploadable_item, dependent: :destroy
  has_many :additional_categories, through: :uploadable_items_subcategories, class_name: "Category", source: :category

  validates :category, :title, :document, presence: true

  accepts_nested_attributes_for :uploadable_items_subcategories, allow_destroy: true

  has_attached_file :document, styles: { medium: ["400x500>", :png], thumb: "126x138>", large: ["800x1035>", :png] }, :convert_options => { :all => '-alpha remove -background white' }
  validates_attachment :document, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document application/vnd.openxmlformats-officedocument.presentationml.slideshow application/vnd.ms-powerpointtd application/vnd.ms-powerpoint application/vnd.openxmlformats-officedocument.presentationml.presentation application/msword application/x-ole-storage)}

end
