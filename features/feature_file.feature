Feature: Sign Up Functionality Feature

@Valid
Scenario Outline: Valid Users
Given User clicks Sign up
When I enter <emailid> <firstname> <lastname> <companyname> <password> and <confirmpassword>
Then I check for <firstname> on home

Examples:
|emailid|firstname|lastname|companyname|password|confirmpassword|
|tanshika-arora@mail.com|Tanshika|Arora|Vinsol|123456|123456|
|tanshika.arora@mail.com|Tanshika|Arora|Vinsol|123456|123456|
|tanshika@mail.com|Tanshika|Arora|Vinsol|123456|123456|
|tanshika_arora@mail.com|Tanshika|Arora|Vinsol|123456|123456|
|tanshika.arora@mail.cc|Tanshika|Arora|Vinsol|123456|123456|
|tanshika.arora@mail-archive.com|Tanshika|Arora|Vinsol|123456|123456|
|tanshika.arora@mail.org|Tanshika|Arora|Vinsol|pass123|pass123|


@Invalid
Scenario Outline: Invalid Users
Given User clicks Sign up
When I enter <emailid> <firstname> <lastname> <companyname> <password> and <confirmpassword>
Then Error is Displayed if invalid credentials are entered

Examples:
|emailid|firstname|lastname|companyname|password|confirmpassword|
|tvin@fg.com|Tanshika|Arora|Vinsol|123456|12345|
| |Tanshika|Arora | | | |
|tanshika@com|Tanshika|Arora|Vinsol|123456|123456|
|.tanshika@domain.com|Tanshika|Arora|Vinsol|123456|123456|
|email@gmail.com|Tanshika|Arora|Vinsol|123|123|