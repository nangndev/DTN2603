-- bắt đầu thực hành
-- tạo db
CREATE DATABASE dtn2603_testing_system ;
-- sử dụng db
use dtn2603_testing_system; 
-- tạo bảng
CREATE TABLE department( 
	department_id int primary key auto_increment,
    department_name VARCHAR(100)
);
CREATE TABLE `position`(
	position_id int primary key auto_increment,
    position_name enum('DEV','TEST','SCRUM_MASTER','PM')
);
create table `account`(
	account_id int primary key auto_increment,
    email varchar(100) NOT NULL unique,
    username varchar(100) NOT NULL unique,
    full_name varchar(100), 
    department_id int,
    position_id int,
    create_date datetime,
    foreign key (department_id) references department(department_id),
    foreign key (position_id) references `position`(position_id)
);
create table `group`(
	group_id int primary key auto_increment,
    group_name varchar(100),
    creator_id int ,
    create_date datetime
);
create table group_account(
	group_id int ,
    account_id int ,
    join_date datetime,
    PRIMARY KEY (group_id, account_id),
    foreign key (group_id) references `group`(group_id),
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);
create table type_question(
	type_id int primary key auto_increment,
    type_name enum('ESSAY','MULTIPLE_CHOICE')
);
create table category_question(
	category_id int primary key auto_increment,
    category_name varchar(100)
);
create table question(
	question_id int primary key auto_increment,
    `content` text,
    category_id int,
    type_id int,
    creator_id int,
    create_date datetime,
    foreign key (category_id) references category_question(category_id),
    foreign key (type_id) references type_question(type_id)
);
create table answer(
	answer_id int primary key auto_increment,
    content text,
    question_id int,
    is_correct enum('TRUE','FALSE'),
    foreign key (question_id) references question(question_id)
);
create table exam(
	exam_id int primary key auto_increment,
    `code` varchar(20),
    title varchar(100),
    category_id int,
    duration int,
    creator_id int ,
    create_date datetime,
	foreign key (category_id) references category_question(category_id)
);
create table Exam_question(
	exam_id int,
    question_id int,
    PRIMARY KEY(exam_id, question_id),
    foreign key (question_id) references question(question_id),
    FOREIGN KEY(exam_id) REFERENCES exam(exam_id)
);

    
	
	
    
    
    