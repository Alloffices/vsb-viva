class Center < ApplicationRecord

  belongs_to :location_description, optional: true
  geocoded_by :full_address
  after_validation :geocode

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
    [address_1,address_2,city,county].reject { |ad| ad.blank? }.join(' ')
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

  def get_timing
    timing = [{monday: [monday_hours, monday_ext_hours]}]
    first_time = {monday: [monday_hours, monday_ext_hours]}
    hours = [
      {tuesday: [tuesday_hours, tuesday_ext_hours]},
      {wednesday: [wednesday_hours, wednesday_ext_hours]},
      {thursday: [thursday_hours, thursday_ext_hours]},
      {friday:[friday_hours, friday_ext_hours]},
      {saturday: [saturday_hours, saturday_ext_hours]},
      {sunday: [sunday_hours, sunday_ext_hours]},
    ]
    hours.each do |t|
      unless t[t.keys.first][0] == nil && t[t.keys.first][1] == nil
        if t[t.keys.first][0] == first_time[first_time.keys.first][0] &&
          t[t.keys.first][1] == first_time[first_time.keys.first][1]
          new_key = "#{first_time.keys.first} - #{t.keys.first}"
          timing[timing.length - 1] = {"#{new_key}" => t[t.keys.first]}
        else
          timing << t
          first_time = t
        end
      end
    end
    timing
  end

  def self.format_time(time)
      time.strftime('%l:%M %P')
  end
  def get_number
  end


  def json_events
    events = []
    self.center_events.each do |e|
      events << {
        id: e.id.to_s,
        description: e.description,
        title: e.title,
        start: e.start_date,
        start_time: e.start_time,
        end_time: e.end_time
      }
    end
    events
  end
  def self.get_key(time)
    time.stringify_keys.keys&.first&.split('_')&.first&.capitalize
  end
end
