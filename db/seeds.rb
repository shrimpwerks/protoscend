# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create! fname: 'Donald',      lname: 'Trump',     email: 'racist@gop.com',             password: 'keyboardcat', user_level: 1
User.create! fname: 'Chris',       lname: 'Sharma',    email: 'chris.sharma@mail.com',      password: 'keyboardcat', user_level: 1
User.create! fname: 'Steve',       lname: 'Jobs',      email: 'steve.jobs@me.com',          password: 'keyboardcat', user_level: 1
User.create! fname: 'Bear',        lname: 'Grylls',    email: 'peejoke@mail.com',           password: 'keyboardcat', user_level: 1
User.create! fname: 'Waka Flocka', lname: 'Flame',     email: 'waka.f.flame@mail.com',      password: 'keyboardcat', user_level: 2
User.create! fname: 'Barbara',     lname: 'Streisand', email: 'b.streisand@live.com',       password: 'keyboardcat', user_level: 2
User.create! fname: 'Red',         lname: 'Teletubby', email: 'red.teletubby@mail.com',     password: 'keyboardcat', user_level: 3
User.create! fname: 'Obi Wan',     lname: 'Kenobi',    email: 'bigballer69@aol.com',        password: 'keyboardcat', user_level: 3
User.create! fname: 'Optimus',     lname: 'Prime',     email: 'autobots.rollout@spark.com', password: 'keyboardcat', user_level: 5
User.create! fname: 'Jonah',       lname: 'George',    email: 'jonah.george@me.com',        password: 'keyboardcat', user_level: 5
User.create! fname: 'Ty',          lname: 'Skelton',   email: 'tyskelton118@gmail.com',     password: 'keyboardcat', user_level: 5

Route.create! name: 'Metalocalypse', user_id: 1, available_walls_id: 1, \
              location: 'Dixon', tape_color: 'Blue', grade: '5.9+', \
              route_set_date: '2015-01-01', expiration_date: '2015-04-01'

Route.create! name: 'Best Route', user_id: 2, available_walls_id: 2, \
              location: 'Dixon', tape_color: 'Red', grade: '5.10', \
              route_set_date: '2015-05-05', expiration_date: '2015-08-05'

Rating.create! routes_id: 1, users_id: 1, rating: 5
Rating.create! routes_id: 2, users_id: 2, rating: 4
Rating.create! routes_id: 1, users_id: 4, rating: 3

Announcement.create! announcement: 'hey look everybody, i\'m announcing this!!1'

MaintenanceRequest.create! routes_id: 1, users_id: 1, reason: 'spinner in the middle', resolved: 0, priority: 1

Comment.create! routes_id: 1, users_id: 1, comment: 'excellent route, brochacho'

SupportTicket.create! users_id: 1, ticket: 'i had a bad experience with the site and I choose to not elaborate.'
