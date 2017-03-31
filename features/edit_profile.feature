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
      |name |acronym |is_thesis |dep_hour |graded_grad_hour |ug_class |non_dep_hour_min |non_dep_hour_max |seminar_hour_min |seminar_hour_max |direct_study_hour_min |direct_study_hour_max |total_hour |total_hour_prior |research_hour_min |research_hour_max |joint_hour_min |joint_hour_max |elective_hour_min |elective_hour_max |
      |Master of Computer Science |MCS |FALSE |18 |0 |1 |0 |6 |1 |1 |0 |3 |30 |0 |0 |0 |0 |0 |0 |0 |
    Given the following Student exist:
      |firstname |lastname |is_f1 |program_id |user_id |yearstart |semstart |yearend |semend |
      |Lei |Li |TRUE |1 |1 |2017 |Spring |2019 |Spring |
      |Meimei |Han |FALSE |1 |2 |2017 |Fall |2019 |Fall |

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
    And I should see "Beginning year:	2017"
    And I should see "First Semester:	Spring"
    And I should see "Expected Graduation year:	2019"
    And I should see "Expected Graduation Semester:	Spring"
    
Scenario: able to edit the personal profile
    Given I am on the student_profile page for "Lilei"
    And I follow "Edit"
    Then I should be on the edit_profile page for "Lilei"
    And  I fill in "First name" with "Le"
    And I press "Update student info"
    Then I should be on the student_profile page for "Lilei"
    And I should see "First name: Le"
    
Scenario: able to edit the personal profile Semester
    Given I am on the student_profile page for "Lilei"
    And I follow "Edit"
    Then I should be on the edit_profile page for "Lilei"
    Then I select "Fall" from "First semester"
    And I press "Update student info"
    Then I should be on the student_profile page for "Lilei"
    And I should see "First Semester:	Fall"
