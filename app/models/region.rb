class Region < ApplicationRecord
	validates :name ,:state ,presence:true
end
