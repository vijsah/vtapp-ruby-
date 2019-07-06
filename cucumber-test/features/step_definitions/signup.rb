require_relative '../pages/signup_page.rb'

Given(/^User clicks Sign up$/) do
	@signup_page = Signup.new($browser)
	@signup_page.visit_site
	@signup_page.click_signup_link
end

When(/^I enter (.*) (.*) (.*) (.*) (.*) and (.*)$/) do |emailid, firstname, lastname, companyname, password, confirm_password|
	@signup_page.enter_email_id(emailid)
	@signup_page.enter_first_name(firstname)
	@signup_page.enter_last_name(lastname)
	@signup_page.enter_company_name(companyname)
	@signup_page.enter_password(password)
	@signup_page.enter_confirm_password(confirm_password)
	@signup_page.click_signup_button
end

Then(/^I check for (.*) on home$/) do |firstname|
	wait = Selenium::WebDriver::Wait.new(:timeout => 10)
	wait.until { expect(@signup_page.signup_home(firstname)).to eql(true) }
	puts "Test Successful"
end

Then(/^Error is Displayed if invalid credentials are entered$/) do
	sleep 10
	errors = @signup_page.signup_errors
	errors.each do |option|
		puts option.text	
	end
end