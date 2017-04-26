# need changes due to new column in students
Feature: Add a Login Page
    As a new student and user of the degree planner
    I must be able to login and create a profile so that the tool helps me create a plan (class schedule) based on my needs (degree plan requirements and interest of electives).
    It must also allow me to save my work so that i can come back to it
    
Background: users, programs, students in database
    Given the following User exist:
      | name | email | password |
      | Lilei|Lilei@tamu.edu|123456|
      | Hanmeimei|Hanmeimei@tamu.edu|123456|
      | Hanlei|Hanlei@tamu.ezdu|123456|
      | Limeimei|Limeimei@tamu.edu|123456|
    Given the following Program exist:
      |name |acronym |is_thesis |dep_hour |graded_grad_hour |ug_hour_min | ug_hour_max |non_dep_hour_min |non_dep_hour_max |seminar_hour_min |seminar_hour_max |direct_study_hour_min |direct_study_hour_max |total_hour |total_hour_prior |research_hour_min |research_hour_max |joint_hour_min |joint_hour_max |elective_hour_min |elective_hour_max | joint_dep |   
      |Master of Computer Science |MCS |FALSE |18 | 28 | 0 |3 |0 |6 |1 |1 |0 |3 |30 |0 |0 |0 |0 |0 |0 |0 | 0 |
    Given the following Semester exist:
      |term |year |
      |Spring |2017 |
      |Summer |2017 |
      |Fall |2017 |
      |Spring |2018 |
      |Summer |2018 |
      |Fall |2018 |
      |Spring |2019 |
      |Summer |2019 |
      |Fall |2019 |
      |Spring |2020 |
      |Summer |2020 |
      |Fall |2020 |
      |Spring |2021 |
      |Summer |2021 |
      |Fall |2021 |

Given I am on the login page
    And  I fill in "Email" with "Lilei@tamu.edu"
    And  I fill in "Password" with "123456"
    And I press "Log in"
    Then I should be on the user page for "Lilei"

Scenario: go to the profile page
    And I should see "You need first complete your profile"
    And I should not see "View your information"
    And I follow "Fill in your information"
    Then I should be on the profile_create page
    
Scenario: create new profile
    Given I am on the profile_create page
    And  I fill in "First name" with "Lei"
    And  I fill in "Last name" with "Han"
    And  I select "True" from "Are you F1?"
    And I select "True" from "If a Ph.D. candidate, do you have a related master degree?"
    And  I select "Master of Computer Science" from "Degree program"
    And I select "2017" from "Year of your first semester"
    And I select "Fall" from "First semester"
    And I select "2019" from "Expected Graduation year"
    And I select "Fall" from "Expected Graduation Semester"
    And I press "Save changes"
    Then I should be on the student_profile page for "Lilei"
    And I should see "Lei's profile was successfully created."
    
Scenario: fail to create new profile because of invalid firstname
    Given I am on the profile_create page
    And  I fill in "Last name" with "Li"
    And  I select "True" from "Are you F1?"
    And  I select "Master of Computer Science" from "Degree program"
    And I select "2017" from "Year of your first semester"
    And I select "Fall" from "First semester"
    And I select "2019" from "Expected Graduation year"
    And I select "Fall" from "Expected Graduation Semester"
    And I press "Save changes"
    Then I should see "Firstname can't be blank"