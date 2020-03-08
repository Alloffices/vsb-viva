class Doctor < ApplicationRecord
	
	enum language:[:English,:Spanish]
	has_many :doctor_specialities , dependent: :destroy
	has_many :specialities ,through: :doctor_specialities 

	has_many :doctor_types , dependent: :destroy
	has_many :physician_types ,through: :doctor_types

	has_many :doctor_insurances , dependent: :destroy
	has_many :insurances ,through: :doctor_insurances
	
	accepts_nested_attributes_for :doctor_specialities ,:doctor_types ,:doctor_insurances , allow_destroy: true
end
