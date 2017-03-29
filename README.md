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


|firstname |lastname |is_f1 |program_id |user_id |
|:---|:---|:---|:---|:---|
|Johana  |Rueda |FALSE |1 |1 |
|Yining |Bao |TRUE |2 |2 |
|Andres |Gonzalez |TRUE |3 |3 |
|Shijin |Tang |TRUE |4 |4 |
|Jingjia |Li |FALSE |1 |5 |


### Program


|name |acronym |is_thesis |dep_hour |graded_grad_hour |ug_class |non_dep_hour_min |non_dep_hour_max |seminar_hour_min |seminar_hour_max |direct_study_hour_min |direct_study_hour_max |total_hour |total_hour_prior |research_hour_min |research_hour_max |joint_hour_min |joint_hour_max |elective_hour_min |elective_hour_max |
|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|
|Master of Computer Science |MCS |FALSE |18 |0 |1 |0 |6 |1 |1 |0 |3 |30 |0 |0 |0 |0 |0 |0 |0 |
|Master of Engineering in Computer Science |MEN |FALSE |12 |0 |1 |0 |999 |1 |1 |0 |3 |30 |0 |4 |7 |6 |999 |6 |999 |
|Master of Science in Computer Science |MSCS |TRUE |18 |0 |1 |0 |6 |1 |1 |0 |3 |32 |0 |4 |7 |0 |0 |0 |0 |
|Master of Science in Computer Engineering |MSCE |TRUE |10 |0 |1 |0 |999 |1 |1 |0 |3 |32 |0 |4 |7 |6 |999 |6 |999 |
|PhD in Computer Science |PhDCS |TRUE |30 |0 |0 |0 |6 |1 |2 |0 |0 |96 |64 |18 |999 |0 |0 |0 |0 |
|PhD in Computer Engineering |PhDCE |TRUE |12 |30 |0 |0 |999 |1 |2 |0 |0 |96 |64 |18 |999 |6 |999 |12 |999 |


### Course


|department |number |name |credit |description |is_fall |is_spring |is_summer |
|:---|:---|:---|:---|:---|:---|:---|:---|
|CSCE |603 |Database Systems and Applications |3 |Introduction to the concepts and design methodologies...|false |true |false |
|CSCE |604 |Programming Languages |3 |Study in the design space of programming languages... |true |false |false |
|CSCE |605 |Compiler Design |3 |Advanced topics in compiler writing... |false |true |false |
|CSCE |606 |Software Engineering |3 |Development of advanced concepts in software engineering... |true |true |false |
|CSCE |608 |Database Systems |3 |Database modeling techniques;... |true |false |false |
|CSCE |611 |Operating Systems and Applications |3 |Review of computer architecture ... |true |true |false |


### Coursesection


|Department |number |Section |Instructor |term |Year |GPA |student |A |B |C |D |F |Q |course_id |
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


### Package


|name |no_required |program_id |
|:---|:---|:---|
|Theory |1 |1 |
|Systems |1 |1 |
|Software |1 |1 |
|Theory |1 |3 |
|Systems |1 |3 |
|Software |1 |3 |
|Theory |1 |5 |
|Systems |1 |5 |
|Software |1 |5 |


### Semester


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


### PackageCourseship


|course_id |package_id |
|:---|:---|
|53 |1 |
|55 |1 |
|42 |2 |
|46 |2 |
|47 |2 |
|41 |3 |
|43 |3 |
|72 |3 |
|53 |4 |
|55 |4 |
|42 |5 |
|46 |5 |
|47 |5 |
|41 |6 |
|43 |6 |
|72 |6 |
|53 |7 |
|55 |7 |
|42 |8 |
|46 |8 |
|47 |8 |
|41 |9 |
|43 |9 |
|72 |9 |


### StudentCourseSemestership


|student_id |course_id |semester_id |
|:---|:---|:---|
|1 |6 |1 |
|1 |4 |1 |
|1 |1 |2 |
|2 |6 |1 |
|3 |4 |1 |
|4 |1 |2 |
|5 |1 |2 |


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