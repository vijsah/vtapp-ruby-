Given(/^User clicks Sign up$/) do
	$driver.navigate.to "https://staging-frontend.servedbystadium.com"
	$driver.find_element(:link, "Signup").click
end

When(/^I enter (.*) (.*) (.*) (.*) (.*) and (.*)$/) do |emailid, firstname, lastname, companyname, password, confirmpassword|
	$driver.find_element(:id, "email").send_keys(emailid)
	$driver.find_element(:id, "first_name").send_keys(firstname)
	$driver.find_element(:id, "last_name").send_keys(lastname)
	$driver.find_element(:id, "active_company_name").send_keys(companyname)
	$driver.find_element(:id, "password").send_keys(password)
	$driver.find_element(:id, "password_confirmation").send_keys(confirmpassword)
	$driver.find_element(:xpath, "//button[contains(text(),'Sign Up')]").click
end

Then(/^I check for (.*) on home$/) do |firstname|
	wait = Selenium::WebDriver::Wait.new(:timeout => 10)
	wait.until { expect($driver.find_element(:css, "div.name").text).to eql(firstname) }
	puts "Test Successful"
end

Then(/^Error is Displayed if invalid credentials are entered$/) do
	sleep 10
	errors = $driver.find_elements(:class, "error-message")
	errors.each do |option|
		puts option.text
	end
end