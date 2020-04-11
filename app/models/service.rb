class Service < ApplicationRecord
	validates :name ,presence:true, uniqueness: true
	has_many :center_services ,dependent: :destroy
    has_many :centers ,through: :center_services , dependent: :destroy

    def self.upload_data
    	
    	CSV.foreach('./tmp/insurances.csv',:headers=>true) do |row|
    		Insurance.create!(insurance_name:row[1])
    	end
    	
    	CSV.foreach('./tmp/services.csv',:headers=>true) do |row1|
    		Service.create!(name:row1[1])
    	end
    	
    	CSV.foreach('./tmp/specialities.csv' ,:headers => true) do |row2|
    		Speciality.create!(name:row2[1])
    	end
    	
    	CSV.foreach('./tmp/regions.csv' ,:headers => true) do |row2|
    		Region.create!(name:row2[1],state:row2[2])
    	end
    	
     end
	def self.upload_center
		CSV.foreach('./tmp/centers.csv',:headers=> true) do |c|
			Center.create(name:c[1],center_admin:c[2],address_1:c[3],address_2:c[4],city:c[5],state:c[6],zip_code:c[7],county:c[8],primary_phone:c[9],additional_phones:c[10],fax:c[11],latitude:c[19],longitude:c[20])
		end
	end

	def self.d
		CSV.foreach('./tmp/doctors.csv',:headers => true) do |d|
			unless d[1].nil?
				Doctor.create!(name:d[1],language:d[4],biography:d[7],certifications:d[6],education:d[5],avatar:d[11])
	
			end
		end
	end

	def self.update_c
		CSV.foreach('./tmp/centers.csv',:headers=> true) do |c|
			@center = Center.find_by_name c[1]
			unless @center.nil?
				puts @center.name
				unless c[12].nil?
					puts "mondaytime"
					mondaytime = c[12].split('-')
					@center.monday_hours = mondaytime[0]
					@center.monday_ext_hours = mondaytime[1]
				else
					@center.monday_hours = nil
					@center.monday_ext_hours = nil
				end
				unless c[13].nil?
					puts "ttime"
					ttime = c[13].split('-')
					@center.tuesday_hours = ttime[0]
					@center.tuesday_ext_hours = ttime[1]
				else
					@center.tuesday_hours =  nil
					@center.tuesday_ext_hours = nil
				end
				unless c[14].nil?
					puts "wednesdaytime"
					wtime = c[14].split('-')
					@center.wednesday_hours = wtime[0]
					@center.wednesday_ext_hours = wtime[1]
				else
					@center.wednesday_hours = nil
					@center.wednesday_ext_hours = nil
				end
				unless c[15].nil?
					puts "thurda"
					thtime = c[15].split('-')
					@center.thursday_hours = thtime[0]
					@center.thursday_ext_hours = thtime[1]
				else
					@center.thursday_hours = nil
					@center.thursday_ext_hours = nil
				end

				unless c[16].nil?
					puts "friday"
					ftime = c[16].split('-')
					@center.friday_hours = ftime[0]
					@center.friday_ext_hours = ftime[1]
				else
					@center.friday_hours = nil
					@center.friday_ext_hours = nil
				end
				unless c[17].nil?
					puts "satu"
					satime = c[17].split('-')
					@center.saturday_hours = satime[0]
					@center.saturday_ext_hours = satime[1]
				else
					@center.saturday_hours = nil
					@center.saturday_ext_hours = nil
				end
				unless c[18].nil?
					puts "sunday"
				suntime = c[18].split('-')
				@center.sunday_hours = suntime[0]
				@center.sunday_ext_hours = suntime[1]
				else
					@center.sunday_hours = nil
					@center.sunday_ext_hours = nil
				end
				unless c[21].nil?
					puts "insurance"
					@insurance = Insurance.find_by_insurance_name c[21].strip
					unless @insurance.nil?
						puts "insurancecenter"
						CenterInsurance.create!(insurance_id:@insurance.id,center_id:@center.id)
					else
						puts "insurance create"
						@insurance = Insurance.create!(insurance_name:c[21].strip)
						CenterInsurance.create!(insurance_id:@insurance.id,center_id:@center.id)
					end
				end
				unless c[22].nil?
					puts c[22]
					services = c[22].split(',')
					services.each do |ser|
						s =  Service.find_by_name ser.strip
						unless s.nil?
							puts "services center"
							CenterService.create!(center_id:@center.id,service_id:s.id)	
						else
							puts "service create"
							s = Service.create!(name:ser.strip)
							CenterService.create!(center_id:@center.id,service_id:s.id)	
						end
					end
				end
				unless c[23].nil?
					speciality = c[23].split(',')
					speciality.each do |spe|
						s =  Speciality.find_by_name spe.strip
						unless s.nil?
							puts "speciality center"
							CenterSpeciality.create!(center_id:@center.id,speciality_id:s.id)	
						else
							puts "speciality create"
							s = Speciality.create(name:spe.strip)
							CenterSpeciality.create!(center_id:@center.id,speciality_id:s.id)	
						end
					end
				end
				@center.save
			end
		end
	end
	def self.update_d
		CSV.foreach('./tmp/doctors.csv',:headers => true) do |d|
		
			unless d[0].nil?
				dd=Doctor.find_by_name d[1]
				unless dd.nil?
					unless d[2].nil?
						puts "physician type"
						puts d
						types = d[2].split(',')
						puts types
						types.each do |t|
							ty = PhysicianType.find_by_name t.strip
							unless ty.nil?
								DoctorType.create(doctor_id:dd.id,physician_type_id:ty.id)
							else		
								ty = PhysicianType.create!(name:t.strip)
								DoctorType.create(doctor_id:dd.id,physician_type_id:ty.id)
							end
						end
					end
					
					unless d[3].nil?
						puts "CategoryDocotr "
						puts d
						cat = d[3].split(',')
						cat.each do |t|
							ty = DoctorCategory.find_by_name t.strip
							unless ty.nil?
								CategoryDocotr.create(doctor_id:dd.id,doctor_category_id:ty.id)
							else		
								ty = DoctorCategory.create!(name:t.strip)
								CategoryDocotr.create(doctor_id:dd.id,doctor_category_id:ty.id)
							end
						end
						cen = Center.find_by_name d[10].strip
						unless cen.nil?
							CenterDoctor.create!(doctor_id:dd.id,center_id:cen.id)
						end
					end
				end
			end
		end
	end
end
