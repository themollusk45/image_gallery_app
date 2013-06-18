namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do
		admin = User.create!(name: "Example User",
					 email: "example@railstutorial.org",
					 password: "foobar",
					 password_confirmation: "foobar")
		admin.toggle!(:admin)
		99.times do |n|
			name = "exampleuser-#{n+1}"
			email = "example-#{n+1}@railstutorial.org"
			password = "password"
			User.create!(name:name,
						 email: email,
						 password: password,
						 password_confirmation: password)
		end

		users = User.all(limit: 6)
		45.times do
			title = Faker::Lorem.sentence(4)
			description = Faker::Lorem.sentence(5)
			users.each { |user| user.galleries.create!(title: title, description: description) }
		end

		users = User.all(limit:6)
		5.times do
			title = Faker::Lorem.sentence(3)
			description = Faker::Lorem.sentence(2)
			users.each { |user| user.pics.create!(title: title, description: description, gallery_id: user.galleries.first.id, pic_file: File.open(File.join(Rails.root,'app','assets','images', 'mugen.png'))) }
		end

	end
end