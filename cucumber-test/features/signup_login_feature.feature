Feature: SignUp and Login Functionality Feature

@SignUp_Valid
Scenario Outline: User registering on website with valid credentials
Given User clicks Sign up on the home page of the website
When User enters following details in the signup form: <emailid> <firstname> <lastname> <companyname> <password> and <confirm_password>
And  User Clicks the SignUp Button
Then User should be successfully registered and its first name <firstname> should appear on home

Examples:
|emailid|firstname|lastname|companyname|password|confirm_password|
|tanna-arora@mail.com|Tanshika|Arora|Vinsol|abcdef|abcdef|
|tanna.arora@mail.com|Tanshika|Arora|Vinsol|abcdef|abcdef|
|tanna@mail.com|Tanshika|Arora|Vinsol|abcdef|abcdef|
|tanna_arora@mail.com|Tanshika|Arora|Vinsol|abcdef|abcdef|
|tanna.arora@mail.cc|Tanshika|Arora|Vinsol|abcdef|abcdef|
|tanna.arora@mail-archive.com|Tanshika|Arora|Vinsol|abcdef|abcdef|
|tanna.arora@mail.org|Tanshika|Arora|Vinsol|password|password|

@SignUp_Invalid
Scenario Outline: User registering on website with Invalid credentials
Given User clicks Sign up on the home page of the website
When User enters following details in the signup form: <emailid> <firstname> <lastname> <companyname> <password> and <confirm_password>
And User Clicks the SignUp Button
Then Error should be displayed for the corresponding fields <field_name> in signup form

Examples:
|emailid|firstname|lastname|companyname|password|confirm_password|field_name|
|tanshika@vinsol.com|Tanshika|Arora|Vinsol|pass123|pass123|email_exist|
|tvin@fg.com|Tanshika|Arora|Vinsol|123456|12345|password_mismatch|
| | | | | | |data in all fields required|
|tanshika@com|Tanshika|Arora|Vinsol|123456|123456|invalid_email|
|.tanshika@domain.com|Tanshika|Arora|Vinsol|123456|123456|invalid_email|
|email@gmail.com|Tanshika|Arora|Vinsol|123|123|password_min_char|

@Login_Valid
Scenario Outline: User login with valid credentials
Given User Clicks Login link on the homepage of website
When User enters following details in the login form: <emailid> and <password>
And User Clicks Login button
Then User should be successfully logged in

Examples:
|emailid|password|
|tanshi.arora@mail.com|abcdef|
|tanshi@mail.com|abcdef|
|tanshi_arora@mail.com|abcdef|
|tanshi.arora@mail.cc|abcdef|
|tanshi.arora@mail-archive.com|abcdef|
|tanshi.arora@mail.org|password|

@Login_Invalid
Scenario Outline: User trying to login with invalid credentials
Given User Clicks Login link on the homepage of website
When User enters following details in the login form: <emailid> and <password>
And User Clicks Login button
Then Error should be displayed for the corresponding fields <field_name> in login form

Examples:
|emailid|password|field_name|
| | |data in all fields required|
|tanshika@com|tanshika|invalid email|
|tanshika@vinsol.com|password|incorrect password|
|tanshika@g.corp|tanshika|email doesnot exist|