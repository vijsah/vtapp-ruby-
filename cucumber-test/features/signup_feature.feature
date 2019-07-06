Feature: Sign Up Functionality Feature

@Valid
Scenario Outline: Valid Users
Given User clicks Sign up
When I enter <emailid> <firstname> <lastname> <companyname> <password> and <confirm_password>
Then I check for <firstname> on home

Examples:
|emailid|firstname|lastname|companyname|password|confirm_password|
|tans-arora@mail.com|Tanshika|Arora|Vinsol|abcdef|abcdef|
|tans.arora@mail.com|Tanshika|Arora|Vinsol|abcdef|abcdef|
|tans@mail.com|Tanshika|Arora|Vinsol|abcdef|abcdef|
|tans_arora@mail.com|Tanshika|Arora|Vinsol|abcdef|abcdef|
|tans.arora@mail.cc|Tanshika|Arora|Vinsol|abcdef|abcdef|
|tans.arora@mail-archive.com|Tanshika|Arora|Vinsol|abcdef|abcdef|
|tans.arora@mail.org|Tanshika|Arora|Vinsol|password|password|

@Invalid
Scenario Outline: Invalid Users
Given User clicks Sign up
When I enter <emailid> <firstname> <lastname> <companyname> <password> and <confirm_password>
Then Error is Displayed if invalid credentials are entered

Examples:
|emailid|firstname|lastname|companyname|password|confirm_password|
| | | | | | |
|tanshika@vinsol.com|Tanshika|Arora|Vinsol|pass123|pass123|
|tvin@fg.com|Tanshika|Arora|Vinsol|123456|12345|
| |Tanshika|Arora | | | |
|tanshika@com|Tanshika|Arora|Vinsol|123456|123456|
|.tanshika@domain.com|Tanshika|Arora|Vinsol|123456|123456|
|email@gmail.com|Tanshika|Arora|Vinsol|123|123|