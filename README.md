# README


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


##### Student


|firstname| lastname|   email|  password|   is_f1|  program_id|  
|:---:|:---:|:---:|:---:|:---:|:---:|
|Johana|    Rueda|  xxx@tamu.edu|   xxx|    false|  1|  
|Yining|    Bao|    yyy@tamu.edu|   yyy|    true|   2|
|Andres|    Gonzalez|   xxx@tamu.edu|   xxx|    true|   3|
|Shijin|    Tang|   yyy@tamu.edu|   yyy|    true|   4|
|Jingjia|   Li| xxx@tamu.edu|   xxx|    false|  1|


##### course  


|department|    number| name|   credit| description|
|:---:|:---:|:---:|:---:|:---:|
CSCE|   601|    Programming with C and Java|    3|a|
CSCE|   602|    Object-Oriented Programming, Development and Software Engineering|  3|b|
CSCE|   603|    Database Systems and Applications|  3|c|
CSCE|   604|    Programming Languages|  3|d|
CSCE|   605 |Compiler Design    |3|e|
CSCE|   606|    Software Engineering    |3|f|
CSCE|   608|    Database Systems    |3|j|
CSCE|   610|    Hypertext/Hypermedia Systems    |3|g|
CSCE|   611|    Operating Systems and Applications  |3|h|
CSCE|   612 |Applied Networks and Distributed Processing    |3|i|


##### semester


term|   year|
|:---:|:---:|
|Spring|    2017|
|Fall|  2017|
|Spring|    2018|


##### student_course_semestership


|Student_ID|    Course_ID|  Semester_ID|  
|:---:|:---:|:---:|
1|  6|  1|
1|  4|  1|
1|  1|  2|
2|  6|  1|
3|  4|  1|
4|  1|  2|
5|  1|  2|


##### program


|name|  acronym|    is_thesis|
|:---:|:---:|:---:|
|Master of Computer Science|    MCS|    false|
|Master of Engineering in Computer Science| MEN|    false|
|Master of Science in Computer Science| MSCS|   true|
|Master of Science in Computer Engineering| MSCE|   true|


##### package


|number|
|:---:|
|1|
|2|
|3|
|4|
|5|


##### program_course_packageship


|program_id|    course_id|  package_id|
|:---:|:---:|:---:|
|1| 1   |1|
|1| 2|  1|
|1| 3   |2|
|1| 4   |2|
|1  |5  |2|
|2| 1   |1|
|2| 6   |1|
|2| 2   |2|
|3| 1   |1|


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
```


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