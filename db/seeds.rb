Program.create( :name => "Master of Computer Science", :acronym => "MCS", :is_thesis => "false")
Program.create( :name => "Master of Engineering in Computer Science", :acronym => "MEN", :is_thesis => "false")
Program.create( :name => "Master of Science in Computer Science", :acronym => "MSCS", :is_thesis => "true")
Program.create( :name => "Master of Science in Computer Engineering", :acronym => "MSCE", :is_thesis => "true")
Course.create( :department => "CSCE", :number => 603, :name => "Database Systems and Applications", :credit => 3, :description => "Introduction to the concepts and design methodologies of database systems for non-computer science majors; emphasis on E. F. Codd's relational model with hands-on design application. No credit will be given for both CSCE 310 and CSCE 603. Prerequisites: CSCE 601; graduate classification.", :is_fall => "false", :is_spring => "true", :is_summer => "false")
Course.create( :department => "CSCE", :number => 604, :name => "Programming Languages", :credit => 3, :description => "Study in the design space of programming languages, covering language processing, formalisms to describe semantics of programming languages, important concepts found in current programming languages, and programming paradigms. Prerequisite: Graduate classification.", :is_fall => "true", :is_spring => "false", :is_summer => "false")
Course.create( :department => "CSCE", :number => 605, :name => "Compiler Design", :credit => 3, :description => "Advanced topics in compiler writing; parser generators and compiler-compilers; dynamic storage and scope resolution; data flow analysis and code optimization. Prerequisite: CSCE 434.", :is_fall => "false", :is_spring => "true", :is_summer => "false")
Course.create( :department => "CSCE", :number => 606, :name => "Software Engineering", :credit => 3, :description => "Development of advanced concepts in software engineering; software development environments as a mechanism for enhancing productivity and software quality; the classification, evaluation and selection of methodologies for environments; rapid prototyping and reusability concepts; artificial intelligence techniques applied to software engineering. Prerequisite: CSCE 431 or approval of instructor.", :is_fall => "true", :is_spring => "true", :is_summer => "false")
Course.create( :department => "CSCE", :number => 608, :name => "Database Systems", :credit => 3, :description => "Database modeling techniques; expressiveness in query languages including knowledge representation; manipulation languages data models; physical data organization; relational database design theory; query processing; transaction management and recovery; distributed data management. Prerequisite: CSCE 310 or CSCE 603.", :is_fall => "true", :is_spring => "false", :is_summer => "false")
Course.create( :department => "CSCE", :number => 611, :name => "Operating Systems and Applications", :credit => 3, :description => "Review of computer architecture hardware/software evolution leading to contemporary operating systems; basic operating systems concepts; methods of operating systems design and construction; algorithms for CPU scheduling memory and general resource allocation; process coordination and management; case studies of several operating systems; quality-of-services of operating systems and their impact on applications. No credit will be given for both CSCE 410 and CSCE 611. Prerequisites: CSCE 313; graduate classification.", :is_fall => "true", :is_spring => "true", :is_summer => "false")
Course.create( :department => "CSCE", :number => 613, :name => "Operating Systems", :credit => 3, :description => "Analysis of algorithms in computer operating systems; sequencing and control algorithms supporting concurrent processes; scheduling algorithms to minimize execution times and mean flow times; algorithms for allocating tasks to processors; allocation of memory (virtual and real); direct access device schedules; auxiliary and buffer storage models. Prerequisite: CSCE 313 or CSCE 611.", :is_fall => "false", :is_spring => "true", :is_summer => "false")
Course.create( :department => "CSCE", :number => 614, :name => "Computer Architecture", :credit => 3, :description => "Reviews of von Neumann architecture and its limitations; parallel computer structures and concurrent computation; pipeline computers and vectorization methods; array processors, multiprocessor architectures and programming; dataflow computers. Prerequisite: CSCE 350/ECEN 350/ECEN 350/CSCE 350.", :is_fall => "true", :is_spring => "true", :is_summer => "false")
Course.create( :department => "CSCE", :number => 617, :name => "Co-Design of Embedded Systems (CODES)", :credit => 3, :description => "Co-design methodologies of hardware-software systems; models of computation (MOC), system specification, co-simulation, synthesis, and verification; hardware-software implementation; core-based systems and interfaces, performance analysis and optimization; system on chip, power aware design. Prerequisites: CSCE 462 or equivalent, CSCE 410 and graduate classification.", :is_fall => "true", :is_spring => "true", :is_summer => "false")
Coursesection.create( :department => "CSCE", :number => 603, :section => 600, :instructor => "JIANG A", :term => "Spring", :year => 2013, :gpa => 4, :student => 17, :a => "100.00%", :b => "0.00%", :c => "0.00%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 1)
Coursesection.create( :department => "CSCE", :number => 603, :section => 600, :instructor => "JIANG A", :term => "Spring", :year => 2014, :gpa => 4, :student => 29, :a => "100.00%", :b => "0.00%", :c => "0.00%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 1)
Coursesection.create( :department => "CSCE", :number => 604, :section => 600, :instructor => "JARVI J", :term => "Fall", :year => 2014, :gpa => "3.542", :student => 24, :a => "54.17%", :b => "45.83%", :c => "0.00%", :d => "0.00%", :f => "0.00%", :q => "4.17%", :course_id => 2)
Coursesection.create( :department => "CSCE", :number => 604, :section => 600, :instructor => "JARVI J", :term => "Fall", :year => 2015, :gpa => "3.714", :student => 7, :a => "85.71%", :b => "0.00%", :c => "14.29%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 2)
Coursesection.create( :department => "CSCE", :number => 605, :section => 600, :instructor => "RAUCHWERGER L", :term => "Spring", :year => 2013, :gpa => "3.667", :student => 6, :a => "66.67%", :b => "33.33%", :c => "0.00%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 3)
Coursesection.create( :department => "CSCE", :number => 605, :section => 600, :instructor => "RAUCHWERGER L", :term => "Spring", :year => 2015, :gpa => "3.556", :student => 9, :a => "66.67%", :b => "22.22%", :c => "11.11%", :d => "0.00%", :f => "0.00%", :q => "11.11%", :course_id => 3)
Coursesection.create( :department => "CSCE", :number => 606, :section => 600, :instructor => "WALKER D", :term => "Fall", :year => 2013, :gpa => "3.951", :student => 102, :a => "98.04%", :b => "0.98%", :c => "0.00%", :d => "0.00%", :f => "0.98%", :q => "0.00%", :course_id => 4)
Coursesection.create( :department => "CSCE", :number => 606, :section => 600, :instructor => "WALKER D", :term => "Fall", :year => 2014, :gpa => "3.83", :student => 100, :a => "84.00%", :b => "15.00%", :c => "1.00%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 4)
Coursesection.create( :department => "CSCE", :number => 606, :section => 600, :instructor => "HUANG S", :term => "Fall", :year => 2015, :gpa => "3.953", :student => 85, :a => "95.29%", :b => "4.71%", :c => "0.00%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 4)
Coursesection.create( :department => "CSCE", :number => 606, :section => 600, :instructor => "WALKER D", :term => "Spring", :year => 2015, :gpa => 4, :student => 57, :a => "100.00%", :b => "0.00%", :c => "0.00%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 4)
Coursesection.create( :department => "CSCE", :number => 606, :section => 600, :instructor => "WALKER D", :term => "Spring", :year => 2016, :gpa => "3.603", :student => 73, :a => "61.64%", :b => "36.99%", :c => "1.37%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 4)
Coursesection.create( :department => "CSCE", :number => 608, :section => 600, :instructor => "JIANG A", :term => "Fall", :year => 2013, :gpa => "3.986", :student => 74, :a => "98.65%", :b => "1.35%", :c => "0.00%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 5)
Coursesection.create( :department => "CSCE", :number => 608, :section => 600, :instructor => "JIANG A", :term => "Fall", :year => 2014, :gpa => "3.429", :student => 98, :a => "42.86%", :b => "57.14%", :c => "0.00%", :d => "0.00%", :f => "0.00%", :q => "1.02%", :course_id => 5)
Coursesection.create( :department => "CSCE", :number => 608, :section => 600, :instructor => "CHEN J", :term => "Fall", :year => 2015, :gpa => "3.259", :student => 58, :a => "31.03%", :b => "63.79%", :c => "5.17%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 5)
Coursesection.create( :department => "CSCE", :number => 611, :section => 600, :instructor => "LEYK T", :term => "Fall", :year => 2014, :gpa => "3.81", :student => 21, :a => "85.71%", :b => "9.52%", :c => "4.76%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 6)
Coursesection.create( :department => "CSCE", :number => 611, :section => 500, :instructor => "BETTATI R", :term => "Spring", :year => 2014, :gpa => "3.556", :student => 18, :a => "55.56%", :b => "44.44%", :c => "0.00%", :d => "0.00%", :f => "0.00%", :q => "11.11%", :course_id => 6)
Coursesection.create( :department => "CSCE", :number => 611, :section => 600, :instructor => "DA S", :term => "Fall", :year => 2015, :gpa => "3.956", :student => 23, :a => "95.65%", :b => "4.35%", :c => "0.00%", :d => "0.00%", :f => "0.00%", :q => "4.35%", :course_id => 6)
Coursesection.create( :department => "CSCE", :number => 613, :section => 600, :instructor => "BETTATI R", :term => "Spring", :year => 2013, :gpa => "3.308", :student => 26, :a => "61.54%", :b => "15.38%", :c => "15.38%", :d => "7.69%", :f => "0.00%", :q => "3.85%", :course_id => 7)
Coursesection.create( :department => "CSCE", :number => 613, :section => 600, :instructor => "STOLERU R", :term => "Spring", :year => 2014, :gpa => "3.615", :student => 39, :a => "64.10%", :b => "33.33%", :c => "2.56%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 7)
Coursesection.create( :department => "CSCE", :number => 613, :section => 600, :instructor => "JIMENEZ D", :term => "Spring", :year => 2015, :gpa => "3.958", :student => 24, :a => "95.83%", :b => "4.17%", :c => "0.00%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 7)
Coursesection.create( :department => "CSCE", :number => 613, :section => 600, :instructor => "DA S", :term => "Spring", :year => 2016, :gpa => "3.564", :student => 39, :a => "64.10%", :b => "28.21%", :c => "7.69%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 7)
Coursesection.create( :department => "CSCE", :number => 614, :section => 600, :instructor => "KIM E", :term => "Fall", :year => 2013, :gpa => "3.438", :student => 48, :a => "50.00%", :b => "43.75%", :c => "6.25%", :d => "0.00%", :f => "0.00%", :q => "2.08%", :course_id => 8)
Coursesection.create( :department => "CSCE", :number => 614, :section => 600, :instructor => "TAYLOR V", :term => "Spring", :year => 2013, :gpa => "3.704", :student => 27, :a => "74.07%", :b => "22.22%", :c => "3.70%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 8)
Coursesection.create( :department => "CSCE", :number => 614, :section => 600, :instructor => "KIM E", :term => "Fall", :year => 2014, :gpa => "3.328", :student => 61, :a => "39.34%", :b => "54.10%", :c => "6.56%", :d => "0.00%", :f => "0.00%", :q => "6.56%", :course_id => 8)
Coursesection.create( :department => "CSCE", :number => 614, :section => 600, :instructor => "JIMENEZ D", :term => "Spring", :year => 2014, :gpa => "3.081", :student => 37, :a => "37.84%", :b => "40.54%", :c => "16.22%", :d => "2.70%", :f => "2.70%", :q => "13.51%", :course_id => 8)
Coursesection.create( :department => "CSCE", :number => 614, :section => 600, :instructor => "JIMENEZ D", :term => "Fall", :year => 2015, :gpa => "3.744", :student => 39, :a => "79.49%", :b => "17.95%", :c => "0.00%", :d => "2.56%", :f => "0.00%", :q => "2.56%", :course_id => 8)
Coursesection.create( :department => "CSCE", :number => 614, :section => 600, :instructor => "KIM E", :term => "Spring", :year => 2015, :gpa => "3.538", :student => 52, :a => "55.77%", :b => "42.31%", :c => "1.92%", :d => "0.00%", :f => "0.00%", :q => "5.77%", :course_id => 8)
Coursesection.create( :department => "CSCE", :number => 614, :section => 600, :instructor => "KIM E", :term => "Spring", :year => 2016, :gpa => "3.538", :student => 52, :a => "65.38%", :b => "23.08%", :c => "11.54%", :d => "0.00%", :f => "0.00%", :q => "1.92%", :course_id => 8)
Coursesection.create( :department => "CSCE", :number => 617, :section => 601, :instructor => "MAHAPATRA R", :term => "Fall", :year => 2013, :gpa => "3.375", :student => 8, :a => "50.00%", :b => "37.50%", :c => "12.50%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 9)
Coursesection.create( :department => "CSCE", :number => 617, :section => 600, :instructor => "MAHAPATRA R", :term => "Spring", :year => 2013, :gpa => "3.833", :student => 12, :a => "83.33%", :b => "16.67%", :c => "0.00%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 9)
Coursesection.create( :department => "CSCE", :number => 617, :section => 601, :instructor => "MAHAPATRA R", :term => "Fall", :year => 2014, :gpa => "3.714", :student => 14, :a => "71.43%", :b => "28.57%", :c => "0.00%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 9)
Coursesection.create( :department => "CSCE", :number => 617, :section => 601, :instructor => "MAHAPATRA R", :term => "Fall", :year => 2015, :gpa => "3.867", :student => 15, :a => "86.67%", :b => "13.33%", :c => "0.00%", :d => "0.00%", :f => "0.00%", :q => "0.00%", :course_id => 9)
Package.create( :number => 1, :no_required => 1, :program_id => 1)
Package.create( :number => 2, :no_required => 2, :program_id => 1)
Package.create( :number => 3, :no_required => 1, :program_id => 1)
Package.create( :number => 4, :no_required => 2, :program_id => 2)
Package.create( :number => 5, :no_required => 1, :program_id => 2)
Package.create( :number => 6, :no_required => 1, :program_id => 2)
Package.create( :number => 7, :no_required => 2, :program_id => 3)
Package.create( :number => 8, :no_required => 2, :program_id => 3)
Package.create( :number => 9, :no_required => 2, :program_id => 3)
Package.create( :number => 10, :no_required => 3, :program_id => 4)
Package.create( :number => 11, :no_required => 1, :program_id => 4)
Package.create( :number => 12, :no_required => 2, :program_id => 4)
Semester.create( :term => "Spring", :year => 2017)
Semester.create( :term => "Fall", :year => 2017)
Semester.create( :term => "Summer", :year => 2017)
Semester.create( :term => "Spring", :year => 2018)
Semester.create( :term => "Fall", :year => 2018)
Semester.create( :term => "Summer", :year => 2018)
Semester.create( :term => "Spring", :year => 2019)
Semester.create( :term => "Fall", :year => 2019)
Semester.create( :term => "Summer", :year => 2019)
Semester.create( :term => "Spring", :year => 2020)
Semester.create( :term => "Fall", :year => 2020)
Semester.create( :term => "Summer", :year => 2020)
Semester.create( :term => "Spring", :year => 2021)
Semester.create( :term => "Fall", :year => 2021)
Semester.create( :term => "Summer", :year => 2021)
User.create( :name => "Johana", :email => "xxx@tamu.edu", :password => "aaaaaa", :password_confirmation => "aaaaaa")
User.create( :name => "Yining", :email => "yyy@tamu.edu", :password => "aaaaaa", :password_confirmation => "aaaaaa")
User.create( :name => "Andres", :email => "xxx2@tamu.edu", :password => "aaaaaa", :password_confirmation => "aaaaaa")
User.create( :name => "Shijin", :email => "yyy1@tamu.edu", :password => "aaaaaa", :password_confirmation => "aaaaaa")
User.create( :name => "Jingjia", :email => "xxx3@tamu.edu", :password => "aaaaaa", :password_confirmation => "aaaaaa")
Student.create( :firstname => "Johana", :lastname => "Rueda", :is_f1 => "false", :program_id => 1, :user_id => 1)
Student.create( :firstname => "Yining", :lastname => "Bao", :is_f1 => "true", :program_id => 2, :user_id => 2)
Student.create( :firstname => "Andres", :lastname => "Gonzalez", :is_f1 => "true", :program_id => 3, :user_id => 3)
Student.create( :firstname => "Shijin", :lastname => "Tang", :is_f1 => "true", :program_id => 4, :user_id => 4)
Student.create( :firstname => "Jingjia", :lastname => "Li", :is_f1 => "false", :program_id => 1, :user_id => 5)
PackageCourseship.create( :course_id => 1, :package_id => 1)
PackageCourseship.create( :course_id => 2, :package_id => 1)
PackageCourseship.create( :course_id => 3, :package_id => 1)
PackageCourseship.create( :course_id => 4, :package_id => 2)
PackageCourseship.create( :course_id => 5, :package_id => 2)
PackageCourseship.create( :course_id => 6, :package_id => 2)
PackageCourseship.create( :course_id => 7, :package_id => 3)
PackageCourseship.create( :course_id => 8, :package_id => 3)
PackageCourseship.create( :course_id => 9, :package_id => 3)
PackageCourseship.create( :course_id => 1, :package_id => 4)
PackageCourseship.create( :course_id => 2, :package_id => 4)
PackageCourseship.create( :course_id => 3, :package_id => 4)
PackageCourseship.create( :course_id => 4, :package_id => 5)
PackageCourseship.create( :course_id => 5, :package_id => 5)
PackageCourseship.create( :course_id => 6, :package_id => 5)
PackageCourseship.create( :course_id => 7, :package_id => 6)
PackageCourseship.create( :course_id => 8, :package_id => 6)
PackageCourseship.create( :course_id => 9, :package_id => 6)
PackageCourseship.create( :course_id => 1, :package_id => 7)
PackageCourseship.create( :course_id => 2, :package_id => 7)
PackageCourseship.create( :course_id => 3, :package_id => 7)
PackageCourseship.create( :course_id => 4, :package_id => 8)
PackageCourseship.create( :course_id => 5, :package_id => 8)
PackageCourseship.create( :course_id => 6, :package_id => 8)
PackageCourseship.create( :course_id => 7, :package_id => 9)
PackageCourseship.create( :course_id => 8, :package_id => 9)
PackageCourseship.create( :course_id => 9, :package_id => 9)
PackageCourseship.create( :course_id => 1, :package_id => 10)
PackageCourseship.create( :course_id => 2, :package_id => 10)
PackageCourseship.create( :course_id => 3, :package_id => 10)
PackageCourseship.create( :course_id => 4, :package_id => 11)
PackageCourseship.create( :course_id => 5, :package_id => 11)
PackageCourseship.create( :course_id => 6, :package_id => 11)
PackageCourseship.create( :course_id => 7, :package_id => 12)
PackageCourseship.create( :course_id => 8, :package_id => 12)
PackageCourseship.create( :course_id => 9, :package_id => 12)
StudentCourseSemestership.create( :student_id => 1, :course_id => 6, :semester_id => 1)
StudentCourseSemestership.create( :student_id => 1, :course_id => 4, :semester_id => 1)
StudentCourseSemestership.create( :student_id => 1, :course_id => 1, :semester_id => 2)
StudentCourseSemestership.create( :student_id => 2, :course_id => 6, :semester_id => 1)
StudentCourseSemestership.create( :student_id => 3, :course_id => 4, :semester_id => 1)
StudentCourseSemestership.create( :student_id => 4, :course_id => 1, :semester_id => 2)
StudentCourseSemestership.create( :student_id => 5, :course_id => 1, :semester_id => 2)
