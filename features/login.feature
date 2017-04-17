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
    # Given the following Program exist:
    #   |name |acronym |is_thesis|
    #   |Master of Computer Science |MCS  |false  |
    # Given the following Student exist:
    #   | firstname | lastname | is_f1 | program_id | user_id |
    #   | Lei | Li | TRUE | 1 | 1 |
    #   | Meimei | Han | FALSE | 1 | 2 |

Scenario: go to the log in page
    Given I am on the root page
    When I follow "Log in"
    Then I should be on the login page

Scenario: go to the signup page
    Given I am on the login page
    When I follow "Sign up now!"
    Then I should be on the signup page
    
Scenario: successful login
    Given I am on the login page
    And  I fill in "Email" with "Lilei@tamu.edu"
    And  I fill in "Password" with "123456"
    And I press "Log in"
    Then I should be on the user page for "Lilei"
    And I should see "Welcome Lilei"
    
Scenario: fail to login
    Given I am on the login page
    And  I fill in "Email" with "Lilei@tamu.edu"
    And  I fill in "Password" with "123333"
    And I press "Log in"  
    And I should see "Invalid email/password combination."

Scenario: log out
    Given I am on the login page
    And  I fill in "Email" with "Lilei@tamu.edu"
    And  I fill in "Password" with "123456"
    And I press "Log in"
    And I follow "Account"
    And I follow "Log out"
    Then I should be on the root page




