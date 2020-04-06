class LocationDescription < ApplicationRecord
	validates :description ,presence:true
	has_many :centers , dependent: :destroy
end
