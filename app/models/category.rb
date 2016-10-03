class Category < ActiveRecord::Base
	has_many :flyers

	has_ancestry

end
