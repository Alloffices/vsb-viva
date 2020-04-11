class Center < ApplicationRecord

  belongs_to :location_description, optional: true

  has_many :center_events , dependent: :destroy
  has_many :center_specialities , dependent: :destroy
  has_many :specialities ,through: :center_specialities , dependent: :destroy
  has_many :center_doctors , dependent: :destroy
  has_many :doctors ,through: :center_doctors , dependent: :destroy
  has_many :center_services ,dependent: :destroy
  has_many :services ,through: :center_services , dependent: :destroy
  has_many :center_insurances , dependent: :destroy
  has_many :insurances, through: :center_insurances , dependent: :destroy
  has_many_attached :images


  validates :name, :address_1, :city, :county, :primary_phone,
            :state, :latitude, :longitude, :center_admin, presence:true
  validates_uniqueness_of :name

  accepts_nested_attributes_for :center_doctors,:center_events ,:center_specialities ,:center_services , allow_destroy: true

  def full_address
    [address_1, address_2, city, county,state,zip_code].reject { |ad| ad.blank? }.join(',')
  end

  def city_state
    [city,state].reject{|r| r.blank?}.join(',')
  end

  def address_city
    [address_1,city].reject{|r| r.blank?}.join(' ')
  end

  def state_zip_code
    [state,zip_code].reject{|r| r.blank?}.join(' ')
  end
end
