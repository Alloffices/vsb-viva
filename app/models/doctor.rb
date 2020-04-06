class Doctor < ApplicationRecord



	has_many :category_docotrs , dependent: :destroy
	has_many :doctor_categories, through: :category_docotrs , dependent: :destroy

	has_many :doctor_types, dependent: :destroy
	has_many :physician_types, through: :doctor_types, dependent: :destroy
	has_one_attached :image
	has_one_attached :video


	has_many :center_doctors, dependent: :destroy
	has_many :centers, through: :center_doctors

	accepts_nested_attributes_for  :doctor_types, :center_doctors,:category_docotrs,allow_destroy: true
	
	validates :name , :language ,presence:true
	validates_uniqueness_of :name
end
