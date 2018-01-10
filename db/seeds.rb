entry_data = JSON.parse(File.read('db/seeds/entries.json'));


# entry_data.each do |entry|
#   new_entry = Entry.new(entry)
#   puts "Entry created"
# end

user_data = JSON.parse(File.read('db/seeds/users.json'))

user_data.each do |user|
  new_user = User.new(user)
  entry_data.each do |entry|
    new_entry = Entry.new(entry)
    new_entry.user = new_user
    new_entry.save
    puts "Entry created"
  end
  new_user.save
  puts "User created"

end
