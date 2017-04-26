Feature: Add a Required_Courses Page
    As a new student and user of the degree planner
    I must be able to choose the required courses in my degree so that the tool helps me create a plan (class schedule) based on my degree plan requirements.
    It must also allow me to save my work so that i can come back to it

Background: users, programs, students in database
    Given the following User exist:
      | name | email | password |
      | Lilei|Lilei@tamu.edu|123456|
      | Hanmeimei|Hanmeimei@tamu.edu|123456|
      | Hanlei|Hanlei@tamu.edu|123456|
      | Limeimei|Limeimei@tamu.edu|123456|
    Given the following Program exist:
      |name |acronym |is_thesis |dep_hour |graded_grad_hour | ug_hour_min | ug_hour_max |non_dep_hour_min |non_dep_hour_max |seminar_hour_min |seminar_hour_max |direct_study_hour_min |direct_study_hour_max |total_hour |total_hour_prior |research_hour_min |research_hour_max |joint_hour_min |joint_hour_max |elective_hour_min |elective_hour_max |
      |Master of Computer Science |MCS |FALSE |18 |0 |0 |1 |0 |6 |1 |1 |0 |3 |30 |0 |0 |0 |0 |0 |0 |0 |
 
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
    
    Given the following Student exist:
      |firstname |lastname | program_id | is_f1 | user_id |yearstart |semstart |yearend |semend | has_prior_master |
      |Lei |Li |1 | FALSE | 1 |2017 |Spring |2019 |Spring | FALSE |
      |Meimei |Han |1 | FALSE | 1 |2017 |Spring |2019 |Spring | FALSE |
      
   Given the following Course exist:
      |department |number |name |credit |description |is_fall |is_spring |is_summer |
      |CSCE |603 |Database Systems and Applications |3 |Introduction to the concepts and design methodologies...|false |true |false |
      |CSCE |604 |Programming Languages |3 |Study in the design space of programming languages... |true |false |false |
      |CSCE |605 |Compiler Design |3 |Advanced topics in compiler writing... |false |true |false |
      |CSCE |606 |Software Engineering |3 |Development of advanced concepts in software engineering... |true |true |false |
      |CSCE |608 |Database Systems |3 |Database modeling techniques;... |true |false |false |
      |CSCE |611 |Operating Systems and Applications |3 |Review of computer architecture ... |true |true |false |
      |CSCE	|613 |Operating Systems |3 |Analysis of algorithms in computer operating systems;... |false |true |false |
      |CSCE |614 |Computer Architecture |3 |Reviews of von Neumann architecture and its limitations;... |true |true |false |
    Given the following Package exist:
      |name |no_required |program_id |
      |Theory |1 |1 |
      |Systems |2 |1 |
      |Software |1 |1 |
      |Theory |1 |3 |
      |Systems |1 |3 |
      |Software |1 |3 |
      |Theory |1 |5 |
      |Systems |1 |5 |
      |Software |1 |5 |

    Given the following PackageCourseship exist:
      |course_id |package_id |
      |1 |1 |
      |2 |1 |
      |3 |2 |
      |4 |2 |
      |5 |2 |
      |6 |3 |
      |7 |3 |
      |8 |3 |
      |1 |4 |
      |2 |4 |
      |3 |5 |
      |4 |5 |
      |5 |5 |
      |6 |6 |
      |7 |6 |
      |8 |6 |
      |1 |7 |
      |2 |7 |
      |3 |8 |
      |4 |8 |
      |5 |8 |
      |6 |9 |
      |7 |9 |
      |8 |9 |
    Given I am on the login page
        And  I fill in "Email" with "Lilei@tamu.edu"
        And  I fill in "Password" with "123456"
        And I press "Log in"
        Then I should be on the user page for "Lilei"
    
Scenario: successfully select mandatory courses
    And  I follow "Create degree plan"
    And  I check "courses_1"
    And  I select "Fall" from "semester_1"
    And  I select "2017" from "year_1"
    Then "2017" should be an option for "year_1"
    Then "2020" should not be an option for "year_1" 
    And  I check "courses_4"
    And  I select "Spring" from "semester_4"
    And  I select "2018" from "year_4"
    And  I check "courses_5"
    And  I select "Spring" from "semester_5"
    And  I select "2018" from "year_5"
    And  I check "courses_8"
    And  I select "Spring" from "semester_8"
    And  I select "2017" from "year_8"
    And  I press "Save changes"
    Then I should be on the InterestCourses page for "Lilei"
   
    
    
Scenario: fail to select mandatory courses due to less selected courses
    And  I follow "Create degree plan"
    And  I check "courses_1"
    And  I select "Fall" from "semester_1"
    And  I select "2017" from "year_1"
    And  I check "courses_4"
    And  I select "Spring" from "semester_4"
    And  I select "2018" from "year_4"
    And  I check "courses_8"
    And  I select "Spring" from "semester_8"
    And  I select "2017" from "year_8"
    And  I press "Save changes"
    Then I should see "Pick required number of courses from each package"
    Then the "courses_1" checkbox should be checked
    Then the "courses_2" checkbox should not be checked
    Then "Fall" should be selected for "semester_1"
    Then "Spring" should be selected for "semester_4"
    Then "2018" should be selected for "year_4"    
    
    
Scenario: fail to select mandatory courses due to less selected packages
    And  I follow "Create degree plan"
    And  I check "courses_1"
    And  I select "Fall" from "semester_1"
    And  I select "2017" from "year_1"
    And  I check "courses_4"
    And  I select "Spring" from "semester_4"
    And  I select "2018" from "year_4"
    And  I check "courses_5"
    And  I select "Spring" from "semester_5"
    And  I select "2017" from "year_5"
    And  I press "Save changes"
    Then I should see "Pick required courses from each package"
    Then the "courses_1" checkbox should be checked
    Then the "courses_2" checkbox should not be checked
    Then "Fall" should be selected for "semester_1"
    Then "Spring" should be selected for "semester_4"
    Then "2018" should be selected for "year_4"    
    
Scenario: go plan page and go back, selected courses should be checked
    And  I follow "Create degree plan"
    And  I check "courses_1"
    And  I select "Fall" from "semester_1"
    And  I select "2017" from "year_1"
    Then "2017" should be an option for "year_1"
    Then "2020" should not be an option for "year_1" 
    And  I check "courses_4"
    And  I select "Spring" from "semester_4"
    And  I select "2018" from "year_4"
    And  I check "courses_5"
    And  I select "Spring" from "semester_5"
    And  I select "2018" from "year_5"
    And  I check "courses_8"
    And  I select "Spring" from "semester_8"
    And  I select "2017" from "year_8"
    And  I press "Save changes"
    Then I should be on the InterestCourses page for "Lilei"
    Then I should see "Please pick from the following interest packages"
    And  I press "Save changes"
    Then I should be on the student_plan page for "Lilei"
    And I follow "Back to package courses"
    Then the "courses_1" checkbox should be checked
    Then the "courses_2" checkbox should not be checked
    Then "Fall" should be selected for "semester_1"
    Then "Spring" should be selected for "semester_4"
    Then "2018" should be selected for "year_4"    
    #do not know how to click "More about" and "Delete" due to many instances

