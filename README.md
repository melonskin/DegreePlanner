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
- [] input proper test dataset in db:seed
- [] create controller and views


### Create 3 models


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


In rails console  


```ruby
Student.destroy_all
Semester.destroy_all
Program.destroy_all
Course.destroy_all
StudentCourseSemestership.destroy_all
```


#### Add to `db/seed.rb`


Perhaps generate code with python  


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