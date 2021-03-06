Feature: Validation of degree Plan  
  I must be able to fvalidate my degree plan- MCS validation
  
Background: users in database
    Given the following User exist:
      | name | email | password |
      | TestUserOne | TestUserOne@tamu.edu|123456|
      | TestUserTwo | TestUserTwo@tamu.edu|123456|
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
    Given the following Student exist:
      |firstname |lastname | program_id | is_f1 | user_id |yearstart |semstart |yearend |semend | has_prior_master |
      | TestUserOne |LastNameOne | 1 | False |1 |2017 |Spring |2019 | Fall | FALSE |
      | TestUserTwo |LastNameTwo | 1 | False |2 | 2017 | Spring | 2018 | Fall | FALSE |
    Given the following Course exist:
      |department |number |name |credit |description |is_fall |is_spring |is_summer |
      |CSCE |627 |Theory of Computability |3 |Theory of Computability description...|true |true |false |
      |CSCE |629 |Analysis of Algorithms |3 |Analysis of Algorithms... |true |true|false |
      |CSCE |605 |Compiler Design |3 |Advanced topics in compiler writing... |true |true |false |
      |CSCE	|613 |Operating Systems |3 |Analysis of algorithms in computer operating systems... |true |true |false |
      |CSCE	|614 |Computer Architecture |3 |Computer Architecture... |true |true |false |
      |CSCE |604 |Programming Languages |3 |Study in the design space of programming languages... |true |true |false |
      |CSCE |606 |Software Engineering |3 |Development of advanced concepts in software engineering... |true |true |false |
      |CSCE |655 |Human-Centered Computing |3 |Human-Centered Computing... | true | true |false |
      |CSCE |622 |Generic Programming |3 |The generic programming approach to design and systematic classification of software components... |true |true |false |
      |CSCE |603 |Database Systems and Applications |3 |Introduction to the concepts and design methodologies...|false |true |false |
      |CSCE |608 |Database Systems |3 |Database modeling techniques;... |true |false |false |
      |CSCE |670 |Information Storage and Retrieval | 3 | Information Storage and Retrieval... |true | true | false |
      |CSCE | 675 | Digital Libraries | 3 | Digital Libraries | true | true | false |
      |CSCE | 420 | Artificial Intelligence | 3 | Description of Artificial Intelligence - Ok class to add| true | true | false |
      |CSCE | 491 | Undergraduate research | 3 | Desc of Undergrad research- Not OK to add | true |true |false |
    Given the following Coursesection exist:
      |department | number | section | instructor | term | year | gpa | student | a | b | c | d | f | q | course_id |
      |CSCE |603 | 600 | Jiang A | Spring | 2016 | 3.0 | 8 | 100.00% | 0 | 0 | 0 | 0 | 0 | 1 |
      |CSCE |604 | 600 | Jiang A | Spring | 2016 | 4.0 | 10 | 100.00% | 0 | 0 | 0 | 0 | 0 | 2 |
      |CSCE |605 | 600 | Jiang A | Spring | 2016 | 3.0 | 66 | 100.00% | 0 | 0 | 0 | 0 | 0 | 3 |
      |CSCE |606 | 600 | Jiang A | Spring | 2016 | 4.0 | 98 | 100.00% | 0 | 0 | 0 | 0 | 0 | 4 |
      |CSCE |608 | 600 | Jiang A | Spring | 2016 | 3.0 | 19 | 100.00% | 0 | 0 | 0 | 0 | 0 | 5 |
      |CSCE	|613 | 600 | Jiang A | Fall | 2016 | 3.0 | 80 | 100.00% | 0 | 0 | 0 | 0 | 0 | 7 |
      |CSCE |614 | 600 | Jiang A | Fall | 2016 | 4.0 | 7 | 100.00% | 0 | 0 | 0 | 0 | 0 | 8 |
      |CSCE |622 | 600 | Jiang A | Fall | 2016 | 3.0 | 8 | 100.00% | 0 | 0 | 0 | 0 | 0 | 9 |
      |CSCE |655 | 600 | Jiang A | Fall | 2016 | 4.0 | 8 | 100.00% | 0 | 0 | 0 | 0 | 0 | 10 |
      |CSCE |627 | 600 | Jiang A | Spring | 2016 | 3.0 | 8 | 100.00% | 0 | 0 | 0 | 0 | 0 | 11 |
      |CSCE |629 | 600 | Jiang A | Spring | 2016 | 4.0 | 8 | 100.00% | 0 | 0 | 0 | 0 | 0 | 12 |
      |CSCE |622 | 600 | Jiang A | Spring | 2016 | 4.0 | 8 | 100.00% | 0 | 0 | 0 | 0 | 0 | 12 |
      |CSCE |670| 600 | Jiang A | Spring | 2016 | 4.0 | 8 | 100.00% | 0 | 0 | 0 | 0 | 0 | 12 |
      |CSCE |675 | 600 | Jiang A | Spring | 2016 | 4.0 | 8 | 100.00% | 0 | 0 | 0 | 0 | 0 | 12 |
      |CSCE |420 | 600 | Underdrad prof | Spring | 2016 | 4.0 | 10 | 100.00% | 0 | 0 | 0 | 0 | 0 | 6 |
      |CSCE |491 | 600 | Underdrad prof | Spring | 2016 | 4.0 | 10 | 100.00% | 0 | 0 | 0 | 0 | 0 | 6 |
    Given the following StudentCourseSemestership exist:
      |student_id | course_id | semester_id |
      | 1 | 3 | 1 |
      | 1 | 7 | 1 |
      | 1 | 6 | 3 |
      | 1 | 13 | 3 |
      | 1 | 12 | 4 |
      | 1 | 11 | 4 |
      | 1 | 10 | 6 |
      | 1 | 9 | 6 |
      | 1 | 8 | 7 |
      | 1 | 1 | 7 |
    Given the following Package exist:
      |name |no_required |program_id |
      |Theory |1 |1 |
      |Systems |1 |1 |
      |Software |1 |1 |
    Given the following PackageCourseship exist:
      |course_id |package_id |
      | 1 | 1 |
      | 2 | 1 |
      | 3 | 2 |
      | 4 | 2 |
      | 5 | 2 |
      | 6 | 3 |
      | 7 | 3 |
      | 8 | 3 |
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
      | 6 | 1 |
      | 3 | 1 |
      | 7 | 1 |
      | 4 | 1 |
      | 9 | 1 |
      | 10 | 2 |
      | 11 | 2 |
      | 12 | 2 |
      | 13 | 2 |
    Given the following SpecialCourse exist:
      | department | number | name | description | is_fall | is_spring | is_summer |
      | CSCE | 681 | Seminar | Computer Science Seminar | true | true | false |
      | CSCE | 684 | Professional Internship | Computer Science Internship | false | false | true |
      | CSCE | 685 | Directed Studies | Computer Science Directed Studies | true | true | false |
      | CSCE | 691 | Research | Computer Science research | true | true | true |
    Given I am on the login page
        And  I fill in "Email" with "TestUserOne@tamu.edu"
        And  I fill in "Password" with "123456"
        And I press "Log in"
        Then I should be on the user page for "TestUserOne"
    
Scenario: Valid Semester, change profile, classes out of range
        And I follow "View your information"
        Then I should see "Profile information"
        And I follow "Edit Profile"
        Then I should see "Edit Your Profile"
        And I select "2018" from "Expected Graduation year"
        And I press "Update student info"
        Then I should see "Profile information"
        And I follow "Back to home"
        And I follow "View degree plan"
        Then I should see "Degree Plan Draft"
        Then I should see "Seminar hours: 0/1"
        Then I should not see "Package courses: invalid; go back to edit."
        Then I should see "You have courses out of your semester range."
