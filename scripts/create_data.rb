Company.destroy_all
Contact.destroy_all
Activity.destroy_all

apple = Company.new
apple["name"] = "Apple"
apple["city"] = "Cupertino"
apple["state"] = "CA"
apple.save

amazon = Company.new
amazon["name"] = "Amazon"
amazon["city"] = "Seattle"
amazon["state"] = "WA"
amazon.save

anthropic = Company.new
anthropic["name"] = "Anthropic"
anthropic["city"] = "San Francisco"
anthropic["state"] = "CA"
anthropic.save

# Create contacts and activities

tim = Contact.new
tim["first_name"] = "Tim"
tim["last_name"] = "Cook"
tim["email"] = "tim@apple.com"
tim["phone_number"] = "777-777-7777"
tim["company_id"] = apple["id"]
tim.save

activity = Activity.new
activity["activity_type"] = "email"
activity["contact_id"] = tim["id"]
activity["note"] = "Emailed to set up a time to chat."
activity.save

activity = Activity.new
activity["activity_type"] = "call"
activity["contact_id"] = tim["id"]
activity["note"] = "Good initial chat. Will follow up."
activity.save

craig = Contact.new
craig["first_name"] = "Craig"
craig["last_name"] = "Federighi"
craig["email"] = "craig@apple.com"
craig["phone_number"] = "888-888-8888"
craig["company_id"] = apple["id"]
craig.save

andy = Contact.new
andy["first_name"] = "Andy"
andy["last_name"] = "Jassy"
andy["email"] = "andy@amazon.com"
andy["phone_number"] = "666-666-6666"
andy["company_id"] = amazon["id"]
andy.save

dario = Contact.new
dario["first_name"] = "Dario"
dario["last_name"] = "Amodei"
dario["email"] = "dario@anthropic.com"
dario["phone_number"] = "555-555-5555"
dario["company_id"] = anthropic.id
dario.save

puts "There are now #{Company.all.count} companies, #{Contact.all.count} contacts, and #{Activity.all.count} activities."
