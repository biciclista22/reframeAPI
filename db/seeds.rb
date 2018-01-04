entry_data = JSON.parse(File.read('db/seeds/entries.json'));


entry_data.each do |entry|
  Entry.create!(entry)
  puts "Entry created"
end

user_data = JSON.parse(File.read('db/seeds/users.json'))

user_data.each do |user|
  User.create!(user)
  puts "User created"
end
