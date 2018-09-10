# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create! YAML.load_file 'db/seeds/users.yml' if User.all.empty?

YAML.load_file('db/seeds/areas.yml').each_with_index do |model, idx|
  Area.create! model.merge!({active: true,
                             index: idx})
end if Area.all.empty?

YAML.load_file('db/seeds/activities.yml').each do |model|
  Activity.create! ({published: true,
                     navigated: true,
                     content: '...' }).merge model
end if Activity.all.empty?

YAML.load_file('db/seeds/publishes.yml').each do |model|
  Publish.create! ({published: true}).merge model
end if Publish.all.empty?
