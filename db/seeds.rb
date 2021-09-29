require 'faker'


#Create users withi provider and client roles
puts "Creating providers. This requires internet connection for Faker gem..."
15.times do |index|
  User.create(email: Faker::Internet.unique.email,
              password: '123456',
              role: :provider)
  if index > 9
    puts "Creating clients..." if index === 0
    User.create(email: Faker::Internet.unique.email,
              password: '123456')
  end
end

puts "Creating working hours for providers..."
#Add working hours for every provider
User.where(role: :provider).each do |provider|
  provider.working_hours.create(start_hour: rand(7..11), end_hour: rand(17..20))  
end

puts "Creating provider's services..."
#Add some services to populate the appointments
10.times do
  Service.create(name: Faker::Job.unique.field)
end

months_ary = (1..12).to_a.sample(3) #Data for 3 months and 5 providers
providers_ary = (1..12).to_a.sample(5) #5 providers
clients_ary = User.where(role: :client).pluck(:id)
service_ary = Service.pluck(:id)

puts "Creating appointments..."
months_ary.each do |month|
  providers_ary.each do |prov|
    15.times do #15 appointments for each of the 5 providers
      rnd_client = clients_ary.sample(1)[0]
      rnd_service = service_ary.sample(1)[0]
      rnd_start_date = Date.new(2021,month,rand(1..28))
      rnd_start_hour = rand(9..18)
      rnd_end_hour = rnd_start_hour + rand(1..5)
      app = Appointment.create(client_id: rnd_client, provider_id: prov, service_id: rnd_service, start_day: rnd_start_date, end_day: rnd_start_date, start_hour: rnd_start_hour, end_hour: rnd_end_hour)
      TimeSlot.create(appointment_id: app.id, day_booked: app.start_day, hours: (app.start_hour..app.end_hour-1).to_a)
    end
  end
end
puts "Seeds already planted!"

