-- bắt đầu thực hành
-- tạo db
CREATE DATABASE dtn2603_testing_system ;
-- sử dụng db
USE dtn2603_testing_system; 
-- tạo bảng
CREATE TABLE department( 
	department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100)
);
CREATE TABLE `position`(
	position_id INT PRIMARY KEY AUTO_INCREMENT,
    position_name ENUM('DEV','TEST','SCRUM_MASTER','PM')
);
CREATE TABLE `account`(
	account_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL UNIQUE,
    username VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(100), 
    department_id INT,
    position_id INT,
    create_date DATETIME,
    FOREIGN KEY (department_id) REFERENCES department(department_id),
    FOREIGN KEY (position_id) REFERENCES `position`(position_id)
);
CREATE TABLE `group`(
	group_id INT PRIMARY KEY AUTO_INCREMENT,
    group_name VARCHAR(100),
    creator_id INT ,
    create_date DATETIME
);
CREATE TABLE group_account(
	group_id INT ,
    account_id INT ,
    join_date DATETIME,
    PRIMARY KEY (group_id, account_id),
    FOREIGN KEY (group_id) REFERENCES `group`(group_id),
    FOREIGN KEY (account_id) REFERENCES `account`(account_id)
);
CREATE TABLE type_question(
	type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name ENUM('ESSAY','MULTIPLE_CHOICE')
);
CREATE TABLE category_question(
	category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100)
);
CREATE TABLE question(
	question_id INT PRIMARY KEY AUTO_INCREMENT,
    `content` TEXT,
    category_id INT,
    type_id INT,
    creator_id INT,
    create_date DATETIME,
    FOREIGN KEY (category_id) REFERENCES category_question(category_id),
    FOREIGN KEY (type_id) REFERENCES type_question(type_id)
);
CREATE TABLE answer(
	answer_id INT PRIMARY KEY AUTO_INCREMENT,
    content TEXT,
    question_id INT,
    is_correct ENUM('TRUE','FALSE'),
    FOREIGN KEY (question_id) REFERENCES question(question_id)
);
CREATE TABLE exam(
	exam_id INT PRIMARY KEY AUTO_INCREMENT,
    `code` VARCHAR(20),
    title VARCHAR(100),
    category_id INT,
    duration INT,
    creator_id INT ,
    create_date DATETIME,
	FOREIGN KEY (category_id) REFERENCES category_question(category_id)
);
CREATE TABLE Exam_question(
	exam_id INT,
    question_id INT,
    PRIMARY KEY(exam_id, question_id),
    FOREIGN KEY (question_id) REFERENCES question(question_id),
    FOREIGN KEY(exam_id) REFERENCES exam(exam_id)
);

    
	
	
    
    
    