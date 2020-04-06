class Insurance < ApplicationRecord
  has_many :center_insurances , dependent: :destroy
  has_many :centers, through: :center_insurances , dependent: :destroy
  validates :insurance_name ,presence:true, uniqueness: true
end
