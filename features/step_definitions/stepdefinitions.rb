Given(/^User clicks Sign up on the home page of the website$/) do
	$driver.navigate.to "https://staging-frontend.servedbystadium.com"
	$driver.find_element(:link, "Signup").click
end

When(/^User enters following details in the signup form: (.*) (.*) (.*) (.*) (.*) and (.*)$/) do |emailid, firstname, lastname, companyname, password, confirmpassword|
	$driver.find_element(:id, "email").send_keys(emailid)
	$driver.find_element(:id, "first_name").send_keys(firstname)
	$driver.find_element(:id, "last_name").send_keys(lastname)
	$driver.find_element(:id, "active_company_name").send_keys(companyname)
	$driver.find_element(:id, "password").send_keys(password)
	$driver.find_element(:id, "password_confirmation").send_keys(confirmpassword)
end

When(/^User Clicks the SignUp Button$/) do
	$driver.find_element(:xpath, "//button[contains(text(),'Sign Up')]").click
end

Then(/^User should be successfully registered and its first name (.*) should appear on home$/) do |firstname|
	wait = Selenium::WebDriver::Wait.new(:timeout => 10)
	wait.until { expect($driver.find_element(:css, "div.name").text).to eql(firstname) }
	puts "Successful Signup"
end

Then(/^Error should be displayed for the corresponding fields (.*) in signup form$/) do |field_name|
	sleep 10
	case field_name
	when "data in all fields required"
		expect($driver.find_element(:css, "div.email-field > span.error-message").text).to eql('Required') or
		expect($driver.find_element(:css, "div.name-field > span.error-message").text).to eql('Required') or
		expect($driver.find_element(:css, "div.name-field > span.error-message").text).to eql('Required') or
		expect($driver.find_element(:css, "div.form-field > span.error-message").text).to eql('Required') or
		expect($driver.find_element(:css, "div.password-field > span.error-message").text).to eql('Required') or 
		expect($driver.find_element(:css, "div.password-field > span.error-message").text).to eql('Required')

	when "email_exist"
		expect($driver.find_element(:css, "div.email-field > span.error-message").text).to eql('already exists')

	when "password_mismatch"
		expect($driver.find_element(:css, "div.password-field > span.error-message").text).to eql("doesn't match Password")

	when "invalid_email"
		expect($driver.find_element(:css, "div.email-field > span.error-message").text).to eql('Is invalid')

	when "password_min_char"	
		expect($driver.find_element(:css, "div.password-field > span.error-message").text).to eql('Minimum 6 characters')

	end
end

Given(/^User Clicks Login link on the homepage of website$/) do
	$driver.navigate.to "https://staging-frontend.servedbystadium.com"
	$driver.find_element(:link, "Login").click
end

When(/^User enters following details in the login form: (.*) and (.*)$/) do |emailid, password|
	$driver.find_element(:id, "email").send_keys(emailid)
	$driver.find_element(:id, "password").send_keys(password)
end

When(/^User Clicks Login button$/) do
	$driver.find_element(:xpath, "//button[contains(text(),'Login')]").click
end

Then(/^User should be successfully logged in$/) do 
	wait = Selenium::WebDriver::Wait.new(:timeout => 10)
	wait.until { element_test = $driver.find_element(:css, 'div.name').text
		element_test.instance_of? String }
		puts "Successful Login"
end

Then(/^Error should be displayed for the corresponding fields (.*) in login form$/) do |field_name|
	sleep 10
	case field_name
	when "data in all fields required"
		expect($driver.find_element(:css, "div.email-field > span.error-message").text).to eql('Required') or
		expect($driver.find_element(:css, "div.password-field > span.error-message").text).to eql('Required')

	when "invalid_email"
		expect($driver.find_element(:css, "div.email-field > span.error-message").text).('Is invalid')

	when "email doesnot exist"
		expect($driver.find_element(:css, "div.form-field > span.error-message").text).to eql('Email does not exist')

	when "incorrect password"
		expect($driver.find_element(:css, "div.password-field > span.error-message").text).to eql('Invalid password')
	end
end

