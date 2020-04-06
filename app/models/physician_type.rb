class PhysicianType < ApplicationRecord
	validates :name ,presence:true
	has_many :doctor_types, dependent: :destroy
	has_many :doctors, through: :doctor_types, dependent: :destroy
end
