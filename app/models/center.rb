class Center < ApplicationRecord
  belongs_to :user
  has_many :center_events , dependent: :destroy
  has_many :center_specialities , dependent: :destroy
  has_many :specialities ,through: :center_specialities

  has_many :center_services ,dependent: :destroy
  has_many :services ,through: :center_services
  
  has_many :center_doctors , dependent: :destroy
  has_many :doctors ,through: :center_doctors

end
