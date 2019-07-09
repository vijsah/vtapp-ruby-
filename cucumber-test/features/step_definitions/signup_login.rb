require_relative '../pages/signup_login_page.rb'

Given(/^User clicks Sign up on the home page of the website$/) do
	@signup = Signup_Class.new($browser)
	@signup.visit_site
	@signup.click_signup_link
end

When(/^User enters following details in the signup form: (.*) (.*) (.*) (.*) (.*) and (.*)$/) do |emailid, firstname, lastname, companyname, password, confirm_password|
	@signup.enter_signup_details(emailid, firstname, lastname, companyname, password, confirm_password)
end

When(/^User Clicks the SignUp Button$/) do
	@signup.click_signup_button
end

Then(/^User should be successfully registered and its first name (.*) should appear on home$/) do |firstname|
	wait = Selenium::WebDriver::Wait.new(:timeout => 10)
	wait.until { expect(@signup.signup_home(firstname)).to eql(true) }
	puts "Successful signup"
end

Then(/^Error should be displayed for the corresponding fields (.*) in signup form$/) do |field_name|
	sleep 10
	case field_name
	when "data in all fields required"
		expect(@signup.email_error).to include('Required') or
		expect(@signup.firstname_error).to include('Required') or
		expect(@signup.lastname_error).to include('Required') or
		expect(@signup.companyname_error).to include('Required') or
		expect(@signup.password_error).to include('Required') or 
		expect(@signup.confirmpassword_error).to include('Required')

	when "email_exist"
		expect(@signup.email_error).to include('already exist')

	when "password_mismatch"
		expect(@signup.confirmpassword_error).to include("doesn't match Password")

	when "invalid_email"
		expect(@signup.email_error).to include('Is invalid')

	when "password_min_char"	
		expect(@signup.password_error).to include('Minimum 6 characters')
	end
end


Given(/^User Clicks Login link on the homepage of website$/) do
	@login = Login_Class.new($browser)
	@login.visit_site
	@login.click_login_link
end

When(/^User enters following details in the login form: (.*) and (.*)$/) do |emailid, password|
	@login.enter_login_details(emailid, password)
end

When(/^User Clicks Login button$/) do
	@login.click_login_button
end

Then(/^User should be successfully logged in$/) do
	wait = Selenium::WebDriver::Wait.new(:timeout => 10)
	element_test = @login.home
	wait.until { element_test.instance_of? String }
	puts "Successful Login"
end

Then(/^Error should be displayed for the corresponding fields (.*) in login form$/) do |field_name|
	sleep 10
	case field_name
	when "data in all fields required"
		expect(@login.email_error).to include('Required') or
		expect(@login.password_error).to include('Required')

	when "invalid_email"
		expect(@login.email_error).to include('Is invalid')

	when "email doesnot exist"
		expect(@login.email_error).to include('Email does not exist')

	when "incorrect password"
		expect(@login.password_error).to include('Invalid password')
	end
end