class Signup_Class

  include PageObject

  link(:signup_link, :visible_text => 'Signup')
  text_field(:email, :id => 'email')
  element(:email_error, :css => 'div.email-field > span.error-message')
  element(:firstname_error, :css => 'div.name-field > span.error-message')
  element(:lastname_error, :css => 'div.name-field > span.error-message')
  element(:companyname_error, :css => 'div.form-field > span.error-message')
  element(:password_error, :css => 'div.password-field > span.error-message')
  element(:confirmpassword_error, :css => 'div.password-field > span.error-message')
  text_field(:firstname, :id => 'first_name')
  text_field(:lastname, :id => 'last_name')
  text_field(:companyname, :id => 'active_company_name')
  text_field(:signup_password, :id => 'password')
  text_field(:confirmpassword, :id => 'password_confirmation')
  button(:signup_button, :xpath => '//button[contains(text(),"Sign Up")]')
  div(:home, :css => 'div.name')

  attr_reader :browser

  def initilaize(browser)
    @browser = browser
  end

  def visit_site
    @browser.navigate.to 'https://staging-frontend.servedbystadium.com'
  end

  def click_signup_link
    signup_link
  end

  def enter_signup_details(emailid, firstname, lastname, companyname, password, confirm_password)
    self.email = emailid
    self.firstname = firstname
    self.lastname = lastname
    self.companyname = companyname
    self.signup_password = password
    self.confirmpassword = confirm_password
  end

  def click_signup_button
    signup_button
  end

  def signup_home(firstname)
    home.include?(firstname)
  end
end

class Login_Class

  include PageObject

  link(:login_link, :visible_text => 'Login')
  element(:email_error, :css => 'div.email-field > span.error-message')
  text_field(:email, :id => 'email')
  text_field(:login_password, :xpath => '//*[@id="password"]')
  element(:password_error, :css => 'div.password-field > span.error-message')
  button(:login_button, :xpath => '//button[contains(text(),"Login")]')
  div(:home, :css => 'div.name')

  attr_reader :browser

  def initilaize(browser)
    @browser = browser
  end

  def visit_site
    @browser.navigate.to 'https://staging-frontend.servedbystadium.com'
  end

  def click_login_link
    login_link
  end

  def enter_login_details(emailid, password)
    self.email = emailid
    self.login_password = password
  end

  def click_login_button
    login_button
  end
end