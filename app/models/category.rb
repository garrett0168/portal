class Category < ActiveRecord::Base
	has_many :flyers
	has_many :logos

	has_ancestry

end
