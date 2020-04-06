class Speciality < ApplicationRecord
	validates :name ,presence:true, uniqueness: true
	has_many :center_specialities , dependent: :destroy
    has_many :centers ,through: :center_specialities  , dependent: :destroy
end
