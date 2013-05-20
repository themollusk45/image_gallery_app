def full_title(page_title)
	base_title = "Mugen Gallery"
	if page_title.empty?
		base_title
	else
		"#{base_title} | #{page_title}"
	end
end

def sign_in(user)
	visit signin_path
	fill_in "Name",		with: user.name
	fill_in "Password", with: user.password
	click_button "Sign in"
	#for non Capybara
	cookies[:remember_token] = user.remember_token
end