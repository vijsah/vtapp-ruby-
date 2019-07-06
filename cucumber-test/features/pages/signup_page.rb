class Signup

  include PageObject

  link(:signup_link, :xpath => '//*[@id="root"]/div/div/div[1]/header/div[3]/ul/li[2]/a')
  text_field(:email, :id => 'email')
  text_field(:firstname, :id => 'first_name')
  text_field(:lastname, :id => 'last_name')
  text_field(:companyname, :id => 'active_company_name')
  text_field(:signup_password, :id => 'password')
  text_field(:confirmpassword, :id => 'password_confirmation')
  button(:signup_button, :xpath => '//*[@id="signup-modal"]/div/div[2]/form/div/div/div[5]/button')
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

  def enter_email_id(emailid)
    self.email = emailid
  end

  def enter_first_name(firstname)
    self.firstname = firstname
  end

  def enter_last_name(lastname)
    self.lastname = lastname 
  end

  def enter_company_name(companyname)
    self.companyname = companyname
  end

  def enter_password(password)
    self.signup_password = password
  end

  def enter_confirm_password(confirm_password)
    self.confirmpassword = confirm_password
  end

  def click_signup_button
    signup_button
  end

  def signup_home(firstname)
    home.include?(firstname)
  end

  def signup_errors()
    return @browser.find_elements(:class, "error-message")
  end
end