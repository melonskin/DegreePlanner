Feature: Add a Login Page
    As a new student and user of the degree planner
    I must be able to login and create a profile so that the tool helps me create a plan (class schedule) based on my needs (degree plan requirements and interest of electives).
    It must also allow me to save my work so that i can come back to it
    
Background: users, programs, students in database
    Given the following User exist:
      | name | email | password |
      | Lilei|Lilei@tamu.edu|123456|
      | Hanmeimei|Hanmeimei@tamu.edu|123456|
      | Hanlei|Hanlei@tamu.edu|123456|
      | Limeimei|Limeimei@tamu.edu|123456|
    Given the following Program exist:
      |name |acronym |is_thesis|
      |Master of Computer Science |MCS  |false  |
    Given the following Student exist:
      | firstname | lastname | is_f1 | program_id | user_id |
      | Lei | Li | TRUE | 1 | 1 |
      | Meimei | Han | FALSE | 1 | 2 |

Given I am on the login page
    And  I fill in "Email" with "Hanlei@tamu.edu"
    And  I fill in "Password" with "123456"
    And I press "Log in"
    Then I should be on the user page for "Hanlei"

Scenario: go to the profile page
    And I should see "Fill in your information"
    And I should not see "View your information"
    And I follow "Fill in your information"
    Then I should be on the profile_create page
    
Scenario: create new profile
    Given I am on the profile_create page
    And  I fill in "First name" with "Lei"
    And  I fill in "Last name" with "Han"
    And  I select "True" from "Are you F1?"
    And  I select "Master of Computer Science" from "Degree program"
    And I press "Save changes"
    Then I should be on the student_profile page for "Hanlei"
    And I should see "Lei's profile was successfully created."
    
Scenario: fail to create new profile because of invalid firstname
    Given I am on the profile_create page
    And  I fill in "Last name" with "Han"
    And  I select "True" from "Are you F1?"
    And  I select "Master of Computer Science" from "Degree program"
    And I press "Save changes"
    Then I should see "Firstname can't be blank"