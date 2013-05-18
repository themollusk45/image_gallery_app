FactoryGirl.define do 
	factory :user do
		name					"Mugen9000"
		email					"mugen@example.com"
		password				"foobar"
		password_confirmation 	"foobar"
	end
end