require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.get "http://google.com"

element = driver.find_element :name => "q"
element.send_keys "Vinsol"
element.submit
sleep 10

puts "Page title is #{driver.title}"
driver.quit