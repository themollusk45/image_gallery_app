FactoryGirl.define do 

	factory :user do
		sequence(:name)		{ |n|  "Person #{n}" }
		sequence(:email)	{ |n| "person_#{n}@example.com" }
		password				"foobar"
		password_confirmation 	"foobar"

		factory :admin do
			admin true
		end
	end

	factory :gallery do
		title "agalleryomg"
		description "Lorem ipsum"
		user
	end

	factory :pic do
		
		title "apicturetitle"
		description "somedescription"
		pic_file_file_name { 'mugen.png' } 
		pic_file_content_type { 'image/png' }
		pic_file_file_size { 1024 }
		user
		gallery
	end
end