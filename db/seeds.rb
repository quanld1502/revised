# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ name: 'User A' }, { name: 'User B' }, { name: 'User C' }, { name: 'User D' }])

teams = Team.create([{ name: 'Team A' }, { name: 'Team B' }, { name: 'Team C' }, { name: 'Team D' }])

User.first.deposite(1_000_000)

User.second.deposite(1_000_000)

User.first.transfer(500_000, User.third)

User.second.transfer(500_000, User.fourth)

Team.first.deposite(1_000_000_000)

Team.first.transfer(5_000_000, User.first)