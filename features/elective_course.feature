Feature: Add a interest_courses
    As a new student and user of the degree planner
    I must be able to see the interests packages and pick the electives i would like to take
    It must also allow me to save my work so that i can come back to it
    
Background: users in database
    Given the following User exist:
      | name | email | password |
      | Johana|johanar@tamu.edu|123456|
      | Marcela | marcela@tamu.edu|123456|
    Given the following Program exist:
      |name |acronym |is_thesis |dep_hour |graded_grad_hour |ug_hour_min | ug_hour_max |non_dep_hour_min |non_dep_hour_max |seminar_hour_min |seminar_hour_max |direct_study_hour_min |direct_study_hour_max |total_hour |total_hour_prior |research_hour_min |research_hour_max |joint_hour_min |joint_hour_max |elective_hour_min |elective_hour_max | joint_dep |   
      |Master of Computer Science |MCS |FALSE |18 | 28 | 0 |3 |0 |6 |1 |1 |0 |3 |30 |0 |0 |0 |0 |0 |0 |0 | 0 |
    Given the following Student exist:
      |firstname |lastname | program_id | is_f1 | user_id |yearstart |semstart |yearend |semend | has_prior_master |
      |Johana |Rueda | 1 | FALSE |1 |2017 |Spring |2018 | Fall | FALSE |
      |Marcela |Rueda | 1 |FALSE |1 |2017 |Spring |2018 |Fall | FALSE |
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
      |CSCE |622 |Generic Programming |3 |The generic programming approach to design and systematic classification of software components... |true |true |true |
      |CSCE |655 |Human-Centered Computing |3 |A foundation course in human centered systems... |true |true |true |
      |CSCE |627 |Theory of Computability |3 | Formal models of computation such as pushdown... |true |true |true |
      |CSCE |629 |Analysis of Algorithms |3 | Concrete algorithm design and analysis; abs... |true |true |true |
    
    Given the following Coursesection exist:
      | department | number | section | instructor | term | year | gpa | student | a | b | c | d | f | q | course_id |
      |CSCE |603 | 600 | Jiang A | Spring | 2016 | 3.0 | 8 | 100.00% | 0 | 0 | 0 | 0 | 0 | 1 |
      |CSCE |604 | 600 | Jiang A | Spring | 2016 | 4.0 | 10 | 100.00% | 0 | 0 | 0 | 0 | 0 | 2 |
      |CSCE |605 | 600 | Jiang A | Spring | 2016 | 3.0 | 66 | 100.00% | 0 | 0 | 0 | 0 | 0 | 3 |
      |CSCE |606 | 600 | Jiang A | Spring | 2016 | 4.0 | 98 | 100.00% | 0 | 0 | 0 | 0 | 0 | 4 |
      |CSCE |608 | 600 | Jiang A | Spring | 2016 | 3.0 | 19 | 100.00% | 0 | 0 | 0 | 0 | 0 | 5 |
      |CSCE |611 | 600 | Jiang A | Fall | 2016 | 4.0 | 20 | 100.00% | 0 | 0 | 0 | 0 | 0 | 6 |
      |CSCE	|613 | 600 | Jiang A | Fall | 2016 | 3.0 | 80 | 100.00% | 0 | 0 | 0 | 0 | 0 | 7 |
      |CSCE |614 | 600 | Jiang A | Fall | 2016 | 4.0 | 7 | 100.00% | 0 | 0 | 0 | 0 | 0 | 8 |
      |CSCE |622 | 600 | Jiang A | Fall | 2016 | 3.0 | 8 | 100.00% | 0 | 0 | 0 | 0 | 0 | 9 |
      |CSCE |655 | 600 | Jiang A | Fall | 2016 | 4.0 | 8 | 100.00% | 0 | 0 | 0 | 0 | 0 | 10 |
      |CSCE |627 | 600 | Jiang A | Spring | 2016 | 3.0 | 8 | 100.00% | 0 | 0 | 0 | 0 | 0 | 11 |
      |CSCE |629 | 600 | Jiang A | Spring | 2016 | 4.0 | 8 | 100.00% | 0 | 0 | 0 | 0 | 0 | 12 |
      
    Given the following Package exist:
      |name |no_required |program_id |
      |Systems |1 |1 |
      |Theory |1 |1 |
      |Software |1 |1 |

    Given the following PackageCourseship exist:
      |course_id |package_id |
      |2 | 3|
      |3 | 1|
      |4 | 3|
      |6 | 1|
      |8 | 1|
      |10 | 3|
      |11 | 2|
      |12 | 2|
    
    Given the following Interest exist:
      | name | program_id |
      | Programming | 1 |
      | Database | 1 |
      | Wireless Networks | 1 |
      | Image Processing | 1 |
      | Algorithms | 1 |
      | Artificial Intelligence | 1 |
      | Computer Architecture | 1 |
     
    Given the following InterestCourseship exist:
      | course_id | interest_id |
      | 2 | 1 |
      | 3 | 1 |
      | 4 | 1 |
      | 7 | 1 |
      | 9 | 1 |
      
    Given I am on the login page
        And  I fill in "Email" with "johanar@tamu.edu"
        And  I fill in "Password" with "123456"
        And I press "Log in"
        Then I should be on the user page for "Johana"
    
    Scenario: successfully select mandatory courses and electives
        And  I follow "Create degree plan"
        And  I check "courses_4"
        And  I select "Spring" from "semester_4"
        And  I select "2017" from "year_4"
        And  I check "courses_6"
        And  I select "Spring" from "semester_6"
        And  I select "2017" from "year_6"
        And  I check "courses_11"
        And  I select "Spring" from "semester_11"
        And  I select "2017" from "year_11"
        And  I press "Save changes"
        Then I should be on the InterestCourses page for "Johana"
        And I check "courses_2"
        And I select "Fall" from "semester_2"
        And  I select "2017" from "year_2"
        And I check "courses_3"
        And I select "Fall" from "semester_3"
        And  I select "2017" from "year_3"
        And I check "courses_7"
        And I select "Fall" from "semester_7"
        And  I select "2017" from "year_7"
        And I check "courses_9"
        And I select "Spring" from "semester_9"
        And  I select "2018" from "year_9"
        And  I press "Save changes"
        Then I should be on the student_plan page for "Johana"
    
    Scenario: successfully select mandatory course, go to electives ensure courses are checked
        And  I follow "Create degree plan"
        And  I check "courses_4"
        And  I select "Spring" from "semester_4"
        And  I select "2017" from "year_4"
        And  I check "courses_6"
        And  I select "Spring" from "semester_6"
        And  I select "2017" from "year_6"
        And  I check "courses_11"
        And  I select "Spring" from "semester_11"
        And  I select "2017" from "year_11"
        And  I press "Save changes"
        Then I should be on the InterestCourses page for "Johana"
        And I check "courses_2"
        And I select "Fall" from "semester_2"
        And  I select "2017" from "year_2"
        And I check "courses_3"
        And I select "Fall" from "semester_3"
        And  I select "2017" from "year_3"
        And I check "courses_7"
        And I select "Fall" from "semester_7"
        And  I select "2017" from "year_7"
        And I check "courses_9"
        And I select "Spring" from "semester_9"
        And  I select "2018" from "year_9"
        And  I press "Save changes"
        Then I should be on the student_plan page for "Johana"  
        And I follow "Back to interest courses"
        Then I should be on the InterestCourses page for "Johana"
        Then the "courses_2" checkbox should be checked
        Then "Fall" should be selected for "semester_2"
        Then "2017" should be selected for "year_2"
        Then the "courses_3" checkbox should be checked
        Then "Fall" should be selected for "semester_3"
        Then "2017" should be selected for "year_3"
        Then the "courses_4" checkbox should be checked
        Then "Spring" should be selected for "semester_4"
        Then "2017" should be selected for "year_4"
        Then the "courses_7" checkbox should be checked
        Then "Fall" should be selected for "semester_7"
        Then "2017" should be selected for "year_7"
        Then the "courses_9" checkbox should be checked 
        Then "Spring" should be selected for "semester_9"
        Then "2018" should be selected for "year_9"