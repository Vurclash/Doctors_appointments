roles = ['doctor', 'patient']

10.times do
  doctor = Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  Appointment.create(
    role: roles.sample,
    doctor_id: doctor.id,
  )

 
  10.times do 
    user = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
    )

  end
end

puts "Data Seeded."