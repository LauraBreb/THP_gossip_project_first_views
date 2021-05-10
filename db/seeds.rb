require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all

def generate_user
  first_name = Faker::Name.first_name
  email = Faker::Internet.email(name: first_name)
  user = User.new(first_name: first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence, email: email, age: rand(16..100))
end

def generate_city
  address = Faker::Address.full_address.split(/\s*,\s*/)
  City.create(name: address[1], zip_code: address[2])
end

def generate_gossip
  Gossip.new(title: Faker::GreekPhilosophers.name, content: Faker::GreekPhilosophers.quote)
end

def generate_tag
  Tag.new(title: Faker::Color.color_name )
end

def generate_private_message
  20.times do 
    pm = PrivateMessage.new(content: Faker::Quote.yoda)
    sender = User.find(rand(User.first.id..User.last.id))
    recipient = User.find(rand(User.first.id..User.last.id))
    pm.sender = sender
    pm.recipient = recipient
    pm.save
  end
end

def perform
  10.times do
    user = generate_user
    city = generate_city
    user.city_id = city.id
    user.save
    2.times do
      gossip = generate_gossip
      gossip.user = user
      gossip.save
      rand(1..10).times do
        tag = generate_tag
        gossip.tags << tag
      end
    end
  end
  generate_private_message
  puts "database completed!"
end

perform
