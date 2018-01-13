# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
	[
		{name: "Usuario 1", email: "usuario1@usuario.com", password:"usuario1", password_confirmation: "usuario1"},
		{name: "Usuario 2", email: "usuario2@usuario.com", password:"usuario2", password_confirmation: "usuario2"},
		{name: "Usuario 3", email: "usuario3@usuario.com", password:"usuario3", password_confirmation: "usuario3"},
		{name: "Usuario 4", email: "usuario4@usuario.com", password:"usuario4", password_confirmation: "usuario4"},
		{name: "Usuario 5", email: "usuario5@usuario.com", password:"usuario5", password_confirmation: "usuario5"}
	]
)

User.all.each do |user|
	user.trips.create(
		[
			{from: "spa", where: "ita", start_date: 3.weeks.ago, final_date: 2.weeks.ago},
			{from: "ing", where: "usa", start_date: 1.week.ago, final_date: 1.day.ago},
			{from: "rus", where: "ger", start_date: 1.month.ago, final_date: 3.weeks.ago}
		]
	)
end