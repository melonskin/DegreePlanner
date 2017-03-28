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
    And  I fill in "Email" with "Lilei@tamu.edu"
    And  I fill in "Password" with "123456"
    And I press "Log in"
    Then I should be on the user page for "Lilei"
    
Scenario: able to see personal profile as a comeback user
    And I should see "View your information"
    And I should not see "Fill in your information"
    And I follow "View your information"
    Then I should be on the student_profile page for "Lilei"
    And I should see "First name: Lei"
    And I should see "Last name: Li"
    And I should see "Email: lilei@tamu.edu"
    And I should see "Is F1?: TRUE"
    And I should see "Program: 	Master of Computer Science"
    
Scenario: able to edit the personal profile
    Given I am on the student_profile page for "Lilei"
    And I follow "Edit"
    Then I should be on the edit_profile page for "Lilei"
    And  I fill in "First name" with "Le"
    And I press "Update student info"
    Then I should be on the student_profile page for "Lilei"
    And I should see "First name: Le"
