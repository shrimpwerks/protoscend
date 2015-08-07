# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SmallGroup.create(
  group_name: 'Test Group',
  hidden: 0
)

User.create(
  fname: 'Ty',
  lname: 'Skelton',
  email: 'test.email@mail.com',
  password: 'encrypt-this',
  user_level: 1,
  small_groups_id: 1,
  hidden: 0
)

Announcement.create(
  announcement: 'hey look everybody, i\'m announcing this!!1'
)

AssignedRoute.create(
  users_id: 1,
  gym: 'Dixon',
  grade: '5.10+',
  completed: 0,
  hidden: 0
)

AvailableWall.create(
  location: 'Dixon',
  wall_id: 0
)

Route.create(
  route_name: 'Metalocalypse',
  users_id: 1,
  available_walls_id: 1,
  location: 'Dixon',
  tape_color: 'Blue',
  grade: '5.9+',
  route_set_date: '2015-01-01',
  expiration_date: '2015-04-01'
)

Rating.create(
  routes_id: 1,
  users_id: 1,
  rating: 5
)

MaintenanceRequest.create(
  routes_id: 1,
  users_id: 1,
  reason: 'spinner in the middle',
  resolved: 0,
  priority: 1
)

Comment.create(
  routes_id: 1,
  users_id: 1,
  comment: 'excellent route, brochacho'
)

SupportTicket.create(
  users_id: 1,
  ticket: 'i had a bad experience with the site and I choose to not elaborate.'
)
