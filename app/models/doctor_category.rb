class DoctorCategory < ApplicationRecord
	validates :name ,presence:true
  	has_many :category_docotrs ,dependent: :destroy
  	has_many :doctors,through: :category_docotrs, dependent: :destroy
end
