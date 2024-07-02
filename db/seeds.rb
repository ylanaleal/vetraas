# Delete all users instances
User.destroy_all

# Create a new user instance
User.create!(first_name: 'Gustavo', last_name: 'Vet', email: 'admin@vetraas.com', password: 'flamengo', admin: true)
