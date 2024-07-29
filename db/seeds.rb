# Delete all users and doctors instances
User.destroy_all
Doctor.destroy_all

# Create a new user instance
User.create!(first_name: 'Gustavo', last_name: 'Vet', email: 'admin@vetraas.com', password: 'flamengo', admin: true)

# Create doctors
# vivian Pedrinelli
doctor1 = Doctor.new(first_name: "Vivian", last_name: "Pedrinelli", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
doctor1.save!
Specialty.create!(title: "Nutróloga", value: 400, doctor_id: doctor1.id)

# Attach a photo to the doctor record from local file system
doctor1.photo.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', 'Vivian.jpg')),
  filename: 'Vivian.jpg',
  content_type: 'image/jpg'
)

# Gustavo Santoro
doctor2 = Doctor.new(first_name: "Gustavo", last_name: "Santoro", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
doctor2.save!
Specialty.create!(title: "Ortopedia, Artroscopia, Órteses, Prótese", value: 400, doctor_id: doctor2.id)

# Caio Duarte
doctor3 = Doctor.new(first_name: "Caio", last_name: "Duarte", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
doctor3.save!
Specialty.create!(title: "Cardiologia", value: 400, doctor_id: doctor3.id)

# Karina Borges
doctor4 = Doctor.new(first_name: "Karina", last_name: "Borges", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
doctor4.save!
Specialty.create!(title: "Cirurgia de tecidos moles, Ortopedia", value: 400, doctor_id: doctor4.id)
Specialty.create!(title: "Acupuntura", value: 300, doctor_id: doctor4.id)

# Danielle Zanini
doctor5 = Doctor.new(first_name: "Danielle", last_name: "Zanini", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
doctor5.save!
Specialty.create!(title: "Cirurgia Oncológica, Cirurgia de tecidos moles", value: 400, doctor_id: doctor5.id)

# Helena Creddo
doctor6 = Doctor.new(first_name: "Helena", last_name: "Creddo", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
doctor6.save!
Specialty.create!(title: "Odontologia", value: 250, doctor_id: doctor6.id)


# # Primeiro exemplo
# doctor1 = Doctor.new(first_name: "Vivian", last_name: "Pedrinelli", description: lorem_ipsum(25))
# doctor1.save!
# Specialty.create!(title: "Nutróloga", value: 400, doctor_id: doctor1.id)

# # Gustavo Santoro
# doctor2 = Doctor.new(first_name: "Gustavo", last_name: "Santoro", description: lorem_ipsum(25))
# doctor2.save!
# Specialty.create!(title: "Ortopedia", value: 400, doctor_id: doctor2.id)
# Specialty.create!(title: "Artroscopia", value: 400, doctor_id: doctor2.id)
# Specialty.create!(title: "Órteses", value: 400, doctor_id: doctor2.id)
# Specialty.create!(title: "Prótese", value: 400, doctor_id: doctor2.id)

# # Caio Duarte
# doctor3 = Doctor.new(first_name: "Caio", last_name: "Duarte", description: lorem_ipsum(25))
# doctor3.save!
# Specialty.create!(title: "Cardiologia", value: 400, doctor_id: doctor3.id)

# # Karina Borges (Cirurgia de tecidos moles e Ortopedia)
# doctor4 = Doctor.new(first_name: "Karina", last_name: "Borges", description: lorem_ipsum(25))
# doctor4.save!
# Specialty.create!(title: "Cirurgia de tecidos moles", value: 400, doctor_id: doctor4.id)
# Specialty.create!(title: "Ortopedia", value: 400, doctor_id: doctor4.id)

# # Karina Borges (Acupuntura)
# Specialty.create!(title: "Acupuntura", value: 300, doctor_id: doctor4.id)

# # Danielle Zanini
# doctor5 = Doctor.new(first_name: "Danielle", last_name: "Zanini", description: lorem_ipsum(25))
# doctor5.save!
# Specialty.create!(title: "Cirurgia Oncológica", value: 400, doctor_id: doctor5.id)
# Specialty.create!(title: "Cirurgia de tecidos moles", value: 400, doctor_id: doctor5.id)

# # Helena Creddo
# doctor6 = Doctor.new(first_name: "Helena", last_name: "Creddo", description: lorem_ipsum(25))
# doctor6.save!
# Specialty.create!(title: "Odontologia", value: 250, doctor_id: doctor6.id)
