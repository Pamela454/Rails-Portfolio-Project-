
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'ddave@gmail.com', name: 'Dave', npi: 1234567891, specialty: 'Family Medicine', type: 'Physician', password: 'Dave@123')
User.create(email: 'ssarah@gmail.com', name: 'Sara', npi: 1234567891, specialty: 'Anesthesia', type: 'Physician', password: 'Sarah@123')
User.create(email: 'kkim@gmail.com', name: 'Kim', type: 'Patient', password: 'Kim@123')
User.create(email: 'ssteve@gmail.com', name: 'Steve', type: 'Patient', password: 'Steve@123')
Message.create(title: 'hello', question: 'what does this look like?', patient_id: '3')
Response.create(response: 'Looks like a rash', message_id: '1', physician_id: '2')
Category.create(category: 'New Condition')
Category.create(category: 'Existing Condition')
Category.create(category: 'Gastrointestinal')
Category.create(category: 'Integument(Skin and Nails)')
Category.create(category: 'Cardiovascular')
Category.create(category: 'Neurological')
Category.create(category: 'Endocrine')
Category.create(category: 'Eye and Ocular')
Category.create(category: 'Genital')
Category.create(category: 'Musculoskeletal')
Category.create(category: 'Respiratory')
Category.create(category: 'Urinary')
MessageCategory.create(message_id: '1', category_id: '1')
