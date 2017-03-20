Feature: Add a Login Page
    As a new student and user of the degree planner
    I must be able to login and create a profile so that the tool helps me create a plan (class schedule) based on my needs (degree plan requirements and interest of electives).
    It must also allow me to save my work so that i can come back to it

Background: users in database
    Given the following User exist:
      | name | email | password |
      | Lilei|Lilei@tamu.edu|123456|
      | Hanmeimei|Hanmeimei@tamu.edu|123456|
      | Hanlei|Hanlei@tamu.edu|123456|
      | Limeimei|Limeimei@tamu.edu|123456|

Scenario: go to the sign up page
    Given I am on the root page
    When I follow "Sign up now!"
    Then I should be on the signup page
    
Scenario: successful signup
    Given I am on the signup page
    And  I fill in "Name" with "Student"
    And  I fill in "Email" with "student@tamu.edu"
    And  I fill in "Password" with "123456"
    And  I fill in "Comfirmation" with "123456"
    And I press "Create my account"
    Then I should be on the user page for "Student"
    And I should see "Howdy, welcome to the Degree Planner!"

Scenario: fail to signup because of not using tamu email address
    Given I am on the signup page
    And  I fill in "Name" with "Student"
    And  I fill in "Email" with "student@gmail.com"
    And  I fill in "Password" with "123456"
    And  I fill in "Comfirmation" with "123456"
    And I press "Create my account"
    Then I should be on the signup page
    And I should see "Email is invalid"
    
Scenario: fail to signup because of different password_confirmation
    Given I am on the signup page
    And  I fill in "Name" with "Student"
    And  I fill in "Email" with "student@tamu.edu"
    And  I fill in "Password" with "123456"
    And  I fill in "Comfirmation" with "135678"
    And I press "Create my account"
    Then I should be on the signup page
    And I should see "Password confirmation doesn't match Password"

Scenario: fail to signup because of short password
    Given I am on the signup page
    And  I fill in "Name" with "Student"
    And  I fill in "Email" with "student@tamu.edu"
    And  I fill in "Password" with "123"
    And  I fill in "Comfirmation" with "123"
    And I press "Create my account"
    Then I should be on the signup page
    And I should see "Password is too short"
    
Scenario: fail to signup because of duplicate email
    Given I am on the signup page
    And  I fill in "Name" with "Student"
    And  I fill in "Email" with "Lilei@tamu.edu"
    And  I fill in "Password" with "123"
    And  I fill in "Comfirmation" with "123"
    And I press "Create my account"
    Then I should be on the signup page
    And I should see "Email has already been taken"
