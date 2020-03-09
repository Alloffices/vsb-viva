class Center < ApplicationRecord
  belongs_to :user
  belongs_to :region
  belongs_to :zip_code
  has_many :center_events , dependent: :destroy
  has_many :center_specialities , dependent: :destroy
  has_many :specialities ,through: :center_specialities
  has_many :center_doctors , dependent: :destroy
  has_many :doctors ,through: :center_doctors
  has_many :center_services ,dependent: :destroy
  has_many :services ,through: :center_services
  accepts_nested_attributes_for :center_doctors,:center_events ,:center_specialities ,:center_services , allow_destroy: true
end
