Feature: Matching student and user id
    As a user, I should be directed to my student info page
    
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
    And  I fill in "Email" with "Limeimei@tamu.edu"
    And  I fill in "Password" with "123456"
    And I press "Log in"
    Then I should be on the user page for "Limeimei"
        
        
Scenario: I should be directed to my student profile page after fill in student info 
        Given I am on the login page
        And  I fill in "Email" with "Lilei@tamu.edu"
        And  I fill in "Password" with "123456"
        And I press "Log in"
        Then I should be on the user page for "Lilei"
        And I should see "View your information"
        And I follow "View your information"
        Then I should be on the student_profile page for "Lilei"
        
Scenario: I should be directed to my student profile page after fill in student info 
        Given I am on the login page
        And  I fill in "Email" with "Limeimei@tamu.edu"
        And  I fill in "Password" with "123456"
        And I press "Log in"
        Then I should be on the user page for "Limeimei"
        And I follow "Fill in your information"
        And  I fill in "First name" with "Meimei"
        And  I fill in "Last name" with "Li"
        And  I select "True" from "Are you F1?"
        And  I select "Master of Computer Science" from "Degree program"
        And I select "2017" from "Year of your first semester"
        And I select "Fall" from "First semester"
        And I select "2019" from "Expected Graduation year"
        And I select "Fall" from "Expected Graduation Semester"
        And I press "Save changes"
        Then I should be on the student_profile page for "Limeimei"
        And I should see "Meimei's profile was successfully created."
    
