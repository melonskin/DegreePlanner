# README


# Models


#### User


|name |email |password |password_confirmation |
|:---|:---|:---|:---|
|Johana  |xxx@tamu.edu |aaaaaa |aaaaaa |
|Yining |yyy@tamu.edu |aaaaaa |aaaaaa |
|Andres |xxx2@tamu.edu |aaaaaa |aaaaaa |
|Shijin |yyy1@tamu.edu |aaaaaa |aaaaaa |
|Jingjia |xxx3@tamu.edu |aaaaaa |aaaaaa |


#### Student


|firstname |lastname |is_f1 |program_id |user_id |yearstart |semstart |yearend |semend |has_prior_master |
|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|
|Johana  |Rueda |FALSE |1 |1 |2017 |Spring |2019 |Spring |FALSE |
|Yining |Bao |TRUE |2 |2 |2017 |Fall |2019 |Fall |FALSE |
|Andres |Gonzalez |TRUE |3 |3 |2018 |Spring |2019 |Fall |FALSE |
|Shijin |Tang |TRUE |4 |4 |2018 |Fall |2020 |Fall |FALSE |
|Jingjia |Li |FALSE |1 |5 |2019 |Spring |2022 |Spring |FALSE |


#### Program


|name |acronym |is_thesis |dep_hour |graded_grad_hour |ug_hour_min |ug_hour_max |non_dep_hour_min |non_dep_hour_max |seminar_hour_min |seminar_hour_max |direct_study_hour_min |direct_study_hour_max |total_hour |total_hour_prior |research_hour_min |research_hour_max |joint_dep |joint_hour_min |joint_hour_max |elective_hour_min |elective_hour_max |
|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|
|Master of Computer Science |MCS |FALSE |18 |0 |0 |3 |0 |6 |1 |1 |0 |3 |30 |0 |0 |0 |NA |0 |0 |0 |0 |
|Master of Engineering in Computer Science |MEN |FALSE |12 |0 |0 |3 |0 |999 |1 |1 |0 |3 |30 |0 |4 |7 |ECEN |6 |999 |6 |999 |
|Master of Science in Computer Science |MSCS |TRUE |18 |0 |0 |3 |0 |6 |1 |1 |0 |3 |32 |0 |4 |7 |NA |0 |0 |0 |0 |
|Master of Science in Computer Engineering |MSCE |TRUE |10 |0 |0 |3 |0 |999 |1 |1 |0 |3 |32 |0 |4 |7 |ECEN |6 |999 |6 |999 |
|PhD in Computer Science |PhDCS |TRUE |30 |0 |0 |0 |0 |6 |1 |2 |0 |0 |96 |64 |18 |999 |NA |0 |0 |0 |0 |
|PhD in Computer Engineering |PhDCE |TRUE |12 |30 |0 |0 |0 |999 |1 |2 |0 |0 |96 |64 |18 |999 |ECEN |6 |999 |12 |999 |


#### Package


|name |no_required |program_id |
|:---|:---|:---|
|Theory |1 |1 |
|Systems |2 |1 |
|Software |1 |1 |
|Theory |1 |3 |
|Systems |1 |3 |
|Software |1 |3 |
|Theory |1 |5 |
|Systems |1 |5 |
|Software |1 |5 |


#### Semester


|term |year |
|:---|:---|
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


#### Course


|department |number |name |credit |description |is_fall |is_spring |is_summer |
|:---|:---|:---|:---|:---|:---|:---|:---|
|CSCE |603 |Database Systems and Applications |3 |Prerequisites: CSCE 601; graduate classification. |FALSE |TRUE |FALSE |
|CSCE |604 |Programming Languages |3 |Prerequisite: Graduate classification. |TRUE |FALSE |FALSE |
|CSCE |605 |Compiler Design |3 |Prerequisite: CSCE 434. |FALSE |TRUE |FALSE |
|CSCE |606 |Software Engineering |3 |Prerequisite: CSCE 431 or approval of instructor. |TRUE |TRUE |FALSE |
|CSCE |608 |Database Systems |3 |Prerequisite: CSCE 310 or CSCE 603. |TRUE |FALSE |FALSE |
|CSCE |611 |Operating Systems and Applications |3 |Prerequisites: CSCE 313; graduate classification. |TRUE |TRUE |FALSE |
|CSCE |613 |Operating Systems |3 |Prerequisite: CSCE 313 or CSCE 611. |FALSE |TRUE |FALSE |
|CSCE |614 |Computer Architecture |3 |Prerequisite: CSCE 350/ECEN 350/ECEN 350/CSCE 350. |TRUE |TRUE |FALSE |
|CSCE |617 |Co-Design of Embedded Systems (CODES) |3 |Prerequisites: CSCE 462 or equivalent, CSCE 410 and graduate classification. |TRUE |TRUE |FALSE |
|CSCE |622 |Generic Programming |3 |Prerequisite: CSCE 221. |TRUE |TRUE |FALSE |
|CSCE |624 |Sketch Recognition |3 |Prerequisite: Graduate classification. |TRUE |TRUE |FALSE |


#### Coursesection


|Department |number |Section |Instructor |Term |Year |GPA |student |A |B |C |D |F |Q |course_id |
|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|
|CSCE |603 |600 |JIANG A |Spring |2013 |4 |17 |100.00% |0.00% |0.00% |0.00% |0.00% |0.00% |1 |
|CSCE |603 |600 |JIANG A |Spring |2014 |4 |29 |100.00% |0.00% |0.00% |0.00% |0.00% |0.00% |1 |
|CSCE |604 |600 |JARVI J |Fall |2014 |3.542 |24 |54.17% |45.83% |0.00% |0.00% |0.00% |4.17% |2 |
|CSCE |604 |600 |JARVI J |Fall |2015 |3.714 |7 |85.71% |0.00% |14.29% |0.00% |0.00% |0.00% |2 |
|CSCE |605 |600 |RAUCHWERGER L |Spring |2013 |3.667 |6 |66.67% |33.33% |0.00% |0.00% |0.00% |0.00% |3 |
|CSCE |605 |600 |RAUCHWERGER L |Spring |2015 |3.556 |9 |66.67% |22.22% |11.11% |0.00% |0.00% |11.11% |3 |
|CSCE |606 |600 |WALKER D |Fall |2013 |3.951 |102 |98.04% |0.98% |0.00% |0.00% |0.98% |0.00% |4 |
|CSCE |606 |600 |WALKER D |Fall |2014 |3.83 |100 |84.00% |15.00% |1.00% |0.00% |0.00% |0.00% |4 |
|CSCE |606 |600 |HUANG S |Fall |2015 |3.953 |85 |95.29% |4.71% |0.00% |0.00% |0.00% |0.00% |4 |
|CSCE |606 |600 |WALKER D |Spring |2015 |4 |57 |100.00% |0.00% |0.00% |0.00% |0.00% |0.00% |4 |
|CSCE |606 |600 |WALKER D |Spring |2016 |3.603 |73 |61.64% |36.99% |1.37% |0.00% |0.00% |0.00% |4 |
|CSCE |608 |600 |JIANG A |Fall |2013 |3.986 |74 |98.65% |1.35% |0.00% |0.00% |0.00% |0.00% |5 |
|CSCE |608 |600 |JIANG A |Fall |2014 |3.429 |98 |42.86% |57.14% |0.00% |0.00% |0.00% |1.02% |5 |
|CSCE |608 |600 |CHEN J |Fall |2015 |3.259 |58 |31.03% |63.79% |5.17% |0.00% |0.00% |0.00% |5 |
|CSCE |611 |600 |LEYK T |Fall |2014 |3.81 |21 |85.71% |9.52% |4.76% |0.00% |0.00% |0.00% |6 |
|CSCE |611 |500 |BETTATI R |Spring |2014 |3.556 |18 |55.56% |44.44% |0.00% |0.00% |0.00% |11.11% |6 |
|CSCE |611 |600 |DA S |Fall |2015 |3.956 |23 |95.65% |4.35% |0.00% |0.00% |0.00% |4.35% |6 |
|CSCE |613 |600 |BETTATI R |Spring |2013 |3.308 |26 |61.54% |15.38% |15.38% |7.69% |0.00% |3.85% |7 |
|CSCE |613 |600 |STOLERU R |Spring |2014 |3.615 |39 |64.10% |33.33% |2.56% |0.00% |0.00% |0.00% |7 |
|CSCE |613 |600 |JIMENEZ D |Spring |2015 |3.958 |24 |95.83% |4.17% |0.00% |0.00% |0.00% |0.00% |7 |
|CSCE |613 |600 |DA S |Spring |2016 |3.564 |39 |64.10% |28.21% |7.69% |0.00% |0.00% |0.00% |7 |
|CSCE |614 |600 |KIM E |Fall |2013 |3.438 |48 |50.00% |43.75% |6.25% |0.00% |0.00% |2.08% |8 |
|CSCE |614 |600 |TAYLOR V |Spring |2013 |3.704 |27 |74.07% |22.22% |3.70% |0.00% |0.00% |0.00% |8 |
|CSCE |614 |600 |KIM E |Fall |2014 |3.328 |61 |39.34% |54.10% |6.56% |0.00% |0.00% |6.56% |8 |
|CSCE |614 |600 |JIMENEZ D |Spring |2014 |3.081 |37 |37.84% |40.54% |16.22% |2.70% |2.70% |13.51% |8 |
|CSCE |614 |600 |JIMENEZ D |Fall |2015 |3.744 |39 |79.49% |17.95% |0.00% |2.56% |0.00% |2.56% |8 |
|CSCE |614 |600 |KIM E |Spring |2015 |3.538 |52 |55.77% |42.31% |1.92% |0.00% |0.00% |5.77% |8 |
|CSCE |614 |600 |KIM E |Spring |2016 |3.538 |52 |65.38% |23.08% |11.54% |0.00% |0.00% |1.92% |8 |
|CSCE |617 |601 |MAHAPATRA R |Fall |2013 |3.375 |8 |50.00% |37.50% |12.50% |0.00% |0.00% |0.00% |9 |
|CSCE |617 |600 |MAHAPATRA R |Spring |2013 |3.833 |12 |83.33% |16.67% |0.00% |0.00% |0.00% |0.00% |9 |
|CSCE |617 |601 |MAHAPATRA R |Fall |2014 |3.714 |14 |71.43% |28.57% |0.00% |0.00% |0.00% |0.00% |9 |
|CSCE |617 |601 |MAHAPATRA R |Fall |2015 |3.867 |15 |86.67% |13.33% |0.00% |0.00% |0.00% |0.00% |9 |
|CSCE |622 |600 |STROUSTRUP B |Spring |2013 |3.379 |29 |51.72% |34.48% |13.79% |0.00% |0.00% |0.00% |10 |
|CSCE |622 |600 |JARVI J |Fall |2015 |3.926 |27 |92.59% |7.41% |0.00% |0.00% |0.00% |0.00% |10 |
|CSCE |624 |600 |HAMMOND T |Spring |2013 |3.5 |22 |59.09% |31.82% |9.09% |0.00% |0.00% |0.00% |11 |
|CSCE |624 |600 |HAMMOND T |Fall |2014 |3.958 |24 |95.83% |4.17% |0.00% |0.00% |0.00% |0.00% |11 |
|CSCE |624 |600 |HAMMOND T |Fall |2015 |3.76 |25 |84.00% |8.00% |8.00% |0.00% |0.00% |0.00% |11 |


#### PackageCourseship


|course_id |package_id |
|:---|:---|
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


#### StudentCourseSemestership


|student_id |course_id |semester_id |
|:---|:---|:---|
|1 |6 |1 |
|1 |4 |1 |
|1 |1 |2 |
|2 |6 |1 |
|3 |4 |1 |
|4 |1 |2 |
|5 |1 |2 |


#### Interest


|name |program_id |
|:---|:---|
|Programming |1 |
|Database |1 |
|Wireless networks |1 |
|Image processing |1 |
|Algorithms |1 |
|Artificial intelligence |1 |
|Computer architecture |1 |
|Programming |2 |
|Database |2 |
|Wireless networks |2 |
|Image processing |2 |
|Algorithms |2 |
|Artificial intelligence |2 |
|Computer architecture |2 |
|Programming |3 |
|Database |3 |
|Wireless networks |3 |
|Image processing |3 |
|Algorithms |3 |
|Artificial intelligence |3 |
|Computer architecture |3 |
|Programming |4 |
|Database |4 |
|Wireless networks |4 |
|Image processing |4 |
|Algorithms |4 |
|Artificial intelligence |4 |
|Computer architecture |4 |
|Programming |5 |
|Database |5 |
|Wireless networks |5 |
|Image processing |5 |
|Algorithms |5 |
|Artificial intelligence |5 |
|Computer architecture |5 |
|Programming |6 |
|Database |6 |
|Wireless networks |6 |
|Image processing |6 |
|Algorithms |6 |
|Artificial intelligence |6 |
|Computer architecture |6 |


#### InterestCourseship


|course_id |interest_id |
|:---|:---|
|41 |1 |
|42 |1 |
|43 |1 |
|46 |1 |
|49 |1 |
|40 |2 |
|44 |2 |
|84 |2 |
|87 |2 |
|77 |3 |
|78 |3 |
|79 |3 |
|50 |4 |
|64 |4 |
|67 |4 |
|68 |4 |


#### SpecialCourse


|department |number |name |description |is_fall |is_spring |is_summer |
|:---|:---|:---|:---|:---|:---|:---|
|CSCE |681 |Seminar |.. |TRUE |TRUE |TRUE |
|CSCE |684 |Professional Internship |.. |TRUE |TRUE |TRUE |
|CSCE |685 |Directed Studies |.. |TRUE |TRUE |TRUE |
|CSCE |691 |Research |.. |TRUE |TRUE |TRUE |


#### StudentSpecialCourseSemestership


|student_id |special_course_id |semester_id |credit |
|:---|:---|:---|:---|
|1 |3 |1 |3 |
|1 |2 |1 |4 |
|1 |1 |2 |1 |
|2 |3 |1 |3 |
|3 |4 |1 |5 |
|4 |1 |2 |1 |
|5 |1 |2 |1 |


## TSJ 0329  


- [ ] Limit drop down menu for year
- [ ] Add security validation
- [ ] Add forgot password
- [ ] Add change password
- [ ] Add remember me
- [ ] Write cucumber test
- [ ] Write and revise Rspec test
- [ ] Think about degree validation steps
- [ ] Prevent picking duplicate courses
- [ ] Add function to select research, direct study, seminar
- [ ] Add program advisor to add degrees


## TSJ 0309


- [x] Initial set up
- [x] Create five models (Student, Course, Semester, StudentCourseSemestership and Program)
- [x] Test the relationship between models


To do:  


1. add other 2 models
2. input proper test dataset in db:seed
3. implement Yining's user model


### initial setup


```bash
$ mkdir projects
$ cd projects
$ rails new degreePlanner --skip-test-unit
$ cd degreePlanner
$ bundle install
$ bin/rails server
# ctrl+c to close server if it works well
$ r db:create
```


### create 5 models


```bash
$ rg model student firstname:string lastname:string email:string password:string f1status:string program_id:integer
$ rg model course department:string number:integer name:string credit:integer prerequisite:text
$ rg model semester term:string year:integer
$ rg model student_course_semestership student_id:integer course_id:integer semester_id:integer
$ rg model program name:string acronym:string is_thesis:boolean
$ bin/rake db:migrate
```


### modify models


Then add relationship to models


### test in rails console


#### test program, student; one to many


```ruby
p1 = Program.new(:name => 'Master of Computer Science', :acronym => 'MCS',:is_thesis => false)
p1.save

st1 = Student.new(:firstname=> 'Skin',:lastname=>'Melon',:program => p1)
st1.save
st2 = Student.create(:firstname=> 'Shawn',:lastname=>'Tang',:program_id => p1.id)
p1.students.all
st2.program
## multi program
p2 = Program.create(:name => 'Master of Engineering in Computer Science', :acronym => 'MEN',:is_thesis => false)
```


#### test 3 many to many


```ruby
# set up semeter and course
se1 = Semester.create(:term=>'Fall',:year=>'2016')
se2 = Semester.create(:term=>'Spring',:year=>'2017')
c1 = Course.create(:department => 'CSCE', :number=>'606')
c2 = Course.create(:department => 'MEEN', :number=>'636')
c3 = Course.create(:department => 'CVEN', :number=>'686')

# set up ship
StudentCourseSemestership.create(:student=>st1, :course=>c1, :semester=>se1)
StudentCourseSemestership.create(:student=>st1, :course=>c2, :semester=>se1)
StudentCourseSemestership.create(:student=>st1, :course=>c3, :semester=>se2)
StudentCourseSemestership.create(:student=>st2, :course=>c3, :semester=>se1)
StudentCourseSemestership.create(:student=>st2, :course=>c1, :semester=>se2)
StudentCourseSemestership.create(:student=>st2, :course=>c2, :semester=>se2)

# test
st1.courses
st2.courses
c1.students
se1.courses
StudentCourseSemestership.where(:student=>st1,:semester=>se1).all
```


***


## TSJ 0310


- [x] add other 2 models
- [x] input proper test dataset in db:seed  
- [ ] create controller and views


### Create 2 models


#### bash cmd


```bash
rg model package number:integer
rg model program_course_packageship program_id:integer course_id:integer package_id:integer
```


#### modify models


Then add relationship to models


#### apply migration


```bash
bin/rake db:migrate
```


### create test dataset  


Based on the excel file we have.  


#### Clean db


Change f1status to `is_f1:boolean` in Student  
Change prerequisite to `description:string` in Course  


In Bash


```bash
$ rg migration remove_f1status_from_students f1status:string
$ rg migration add_is_f1_to_students is_f1:boolean
rg migration remove_prerequisite_from_courses prerequisite:text
rg migration add_description_to_courses description:string
```


```bash
rake db:migrate
rake db:migrate:reset
```


#### test models


As shown in Models  


#### Add to `db/seed.rb`


Inside ruby code was generated with some python.  


#### Apply changes in database  


In bash  


```bash
$ rake db:seed
```


Check in rails console  


```ruby
Student.first
Program.first.students.first.courses
```


## TSJ 0311  


- [x] add another model coursesection to store grades, instructors...  
- [x] add columns (is_fall:boolean, is_spring, is_summer) to course model  
- [x] modify the test cases in TSJ 0310  


### coursesection model


In bash  


```bash
rg model coursesection department:string number:integer section:integer instructor:string term:string year:integer gpa:float student:integer a:string b:string c:string d:string f:string q:string course_id:integer
# fix typo
rg migration remove_e_from_coursesections e:string
rg migration add_q_to_coursesections q:string
```


Modify models to create one to many relationship between course and coursesection.  


### add columns to course model


```bash
rg migration add_is_fall_to_courses is_fall:boolean
rg migration add_is_spring_to_courses is_spring:boolean
rg migration add_is_summer_to_courses is_summer:boolean
```


Apply changes to db  


```bash
rake db:migrate
```


### change codes in `db/seed.rb`


## TSJ 0312


- [x] create students controller and views
- [x] modify relationship between program, package, course
- [x] modify :boolean type in Models to :string
- [ ] add courses selected in student's show page. 
- [ ] add login and signup features
- [ ] delete `student#index`


### Validation of student input  


modify student model to add validation of presence.  


### create student controller


```bash
$ rg controller students
```


### modify routes, RESTful


### create student views


Add haml gem to `Gemfile`  
And `bundle install`  


### modify relationships


1. program, package => one to many  
2. package, course => many to many  
3. program, course => don't need


Add a NoCourse column to Package to denote how many courses required in this package. Also add foreign_key: program_id.  


Remove program_course_packageship model


```bash
$ bundle exec rake db:rollback
$ rails destroy model program_course_packageship
$ rg model package_courseship
$ rg migration add_course_id_to_package_courseships course_id:integer
$ rg migration add_package_id_to_package_courseships package_id:integer
$ rg migration add_program_id_to_packages program_id:integer
$ rg migration add_no_required_to_packages no_required:integer
```


### modify :boolean type in Models to :string


Rails seems to handle :boolean badly. 


***


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...