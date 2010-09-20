# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts 'SETTING UP EXAMPLE USERS'
user1 = User.create! :name => 'First User', :email => 'user@test.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user1.name
user2 = User.create! :name => 'Other User', :email => 'otheruser@test.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user2.name
puts 'SETTING UP EXAMPLE SUBDOMAINS'
subdomain1 = Subdomain.create! :name => 'foo'
puts 'Created subdomain: ' << subdomain1.name
subdomain2 = Subdomain.create! :name => 'bar'
puts 'Created subdomain: ' << subdomain2.name
user1.subdomains << subdomain1
user1.save
user2.subdomains << subdomain2
user2.save
