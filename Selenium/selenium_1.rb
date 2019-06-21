require 'selenium-webdriver'
driver = Selenium::WebDriver.for(:chrome)
driver.navigate.to("https://staging-frontend.servedbystadium.com")
SignUp = driver.find_element(:link, "Signup")
SignUp.click

EmailId = driver.find_element(:id, "email")
EmailId.send_keys "tan.arora@gmail.com"

FirstName = driver.find_element(:id, "first_name")
FirstName.send_keys "Tanshika"

LastName = driver.find_element(:id, "last_name")
LastName.send_keys "Arora"

CompanyName = driver.find_element(:id, "active_company_name")
CompanyName.send_keys "Vinayak Solutions Pvt Ltd"

Password = driver.find_element(:id, "password")
Password.send_keys "tanshika1234"

ConfirmPassword = driver.find_element(:id, "password_confirmation")
ConfirmPassword.send_keys "tanshika1234"

SignupButton = driver.find_element(:xpath, "//button[contains(text(),'Sign Up')]")
SignupButton.click

wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds

begin
  NameOnHome = wait.until { driver.find_element(:xpath, "//div[@class='name' and contains(text(), 'Tanshika')]") }
  if NameOnHome.text.include? 'Tanshika'
  	puts 'Test Successful'
  end 
ensure
  driver.quit
end