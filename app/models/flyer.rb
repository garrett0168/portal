class Flyer < ActiveRecord::Base
	belongs_to :user

	has_attached_file :document, styles: { medium: ["300x300>", :png], thumb: "126x138>", large: ["800x1035>", :png] }, :convert_options => { :all => '-alpha remove -background white' }
	validates_attachment :document, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}

end
