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
    Given the following Program exist:
      |name |acronym |is_thesis|
      |Master of Computer Science |MCS  |false  |

Scenario: go to the log in page
    Given I am on the root page
    When I follow "Log in"
    Then I should be on the login page
    
Scenario: successful login
    Given I am on the login page
    And  I fill in "Email" with "Lilei@tamu.edu"
    And  I fill in "Password" with "123456"
    And I press "Log in"
    Then I should be on the user page for "Lilei"
    And I should see "Lilei lilei@tamu.edu"

Scenario: successful signup & fill info & edit info
    Given I am on the signup page
    And  I fill in "Name" with "Student"
    And  I fill in "Email" with "student@tamu.edu"
    And  I fill in "Password" with "123456"
    And  I fill in "Comfirmation" with "123456"
    And I press "Create my account"
    Then I should be on the user page for "Student"
    And I should see "Howdy, welcome to the Degree Planner!"
    Then I follow "Fill in your information"
    And  I fill in "First Name" with "Lei"
    And  I fill in "Last Name" with "Li"
    And  I select "True" from "Are you F1?"
    And  I select "Master of Computer Science" from "Degree Program"
    And I press "Save changes"
    Then I should see "Lei's profile was successfully created."
    Then I follow "Edit"
    And I fill in "First Name" with "Lei"
    And I press "Update student info"
    Then I should see "First Name: Lei"

Scenario: successful signup & fill info & logout & login
    Given I am on the signup page
    And  I fill in "Name" with "Student"
    And  I fill in "Email" with "student@tamu.edu"
    And  I fill in "Password" with "123456"
    And  I fill in "Comfirmation" with "123456"
    And I press "Create my account"
    Then I should be on the user page for "Student"
    And I should see "Howdy, welcome to the Degree Planner!"
    Then I follow "Fill in your information"
    And  I fill in "First Name" with "Lei"
    And  I fill in "Last Name" with "Li"
    And  I select "True" from "Are you F1?"
    And  I select "Master of Computer Science" from "Degree Program"
    And I press "Save changes"
    Then I should see "Lei's profile was successfully created."
    Then I follow "Account"
    And I follow "Log out"
    Then I follow "Log in"
    And I fill in "Email" with "student@tamu.edu"
    And I fill in "Password" with "123456"
    Then I press "Log in!"
    Then I should be on the user page for "Student"
    Then I should see "Student"
    Then I follow "View your information"
    Then I should see "Program: Master of Computer Science"

