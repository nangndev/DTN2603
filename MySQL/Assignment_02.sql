-- bắt đầu thực hành
-- tạo db
CREATE DATABASE IF NOT EXISTS dtn2603_testing_system ;
-- sử dụng db
USE dtn2603_testing_system; 
-- tạo bảng
CREATE TABLE department( 
	department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE `position`(
	position_id INT PRIMARY KEY AUTO_INCREMENT,
    position_name ENUM('DEV','TEST','SCRUM_MASTER','PM') NOT NULL
);
CREATE TABLE `account`(
	account_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL UNIQUE,
    user_name VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL, 
    department_id INT,
    position_id INT,
    create_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES department(department_id),
    FOREIGN KEY (position_id) REFERENCES `position`(position_id)
);
CREATE TABLE `group`(
	group_id INT PRIMARY KEY AUTO_INCREMENT,
    group_name VARCHAR(100) NOT NULL,
    creator_id INT NOT NULL,
    create_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id) 
);
CREATE TABLE group_account(
	group_id INT NOT NULL,
    account_id INT NOT NULL,
    join_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (group_id, account_id),
    FOREIGN KEY (group_id) REFERENCES `group`(group_id),
    FOREIGN KEY (account_id) REFERENCES `account`(account_id)
);
CREATE TABLE type_question(
	type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name ENUM('ESSAY','MULTIPLE_CHOICE') NOT NULL
);
CREATE TABLE category_question(
	category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE question(
	question_id INT PRIMARY KEY AUTO_INCREMENT,
    `content` TEXT NOT NULL,
    category_id INT NOT NULL,
    type_id INT NOT NULL,
    creator_id INT NOT NULL,
    create_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES category_question(category_id),
    FOREIGN KEY (type_id) REFERENCES type_question(type_id),
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);
CREATE TABLE answer(
	answer_id INT PRIMARY KEY AUTO_INCREMENT,
    content TEXT NOT NULL,
    question_id INT NOT NULL,
    is_correct ENUM('TRUE','FALSE') NOT NULL,
    FOREIGN KEY (question_id) REFERENCES question(question_id)
);
CREATE TABLE exam(
	exam_id INT PRIMARY KEY AUTO_INCREMENT,
    `code` VARCHAR(20) NOT NULL,
    title VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    duration INT NOT NULL,
    creator_id INT NOT NULL,
    create_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (category_id) REFERENCES category_question(category_id),
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id),
    CONSTRAINT check_duration CHECK(duration > 0)
);
-- ALTER TABLE exam ADD CONSTRAINT check_duration CHECK (duration > 0);
CREATE TABLE exam_question(
	exam_id INT NOT NULL,
    question_id INT NOT NULL,
    PRIMARY KEY(exam_id, question_id),
    FOREIGN KEY (question_id) REFERENCES question(question_id),
    FOREIGN KEY(exam_id) REFERENCES exam(exam_id)
);
-- MODIFY DATA
-- thêm 5 record vào mỗi bảng
INSERT INTO department(department_id, department_name)
VALUES
(1, 'sale'), 
(2, 'giám đốc'), 
(3, 'bảo vệ'), 
(4, 'thư kí'), 
(5, 'tài chính');
INSERT INTO `position`(position_id, position_name)
VALUES
(1, 'DEV'),
(2, 'TEST'),
(3, 'SCRUM_MASTER'),
(4, 'PM'),
(5, 'PM');
INSERT INTO `account`
(account_id, email, user_name, full_name, department_id, position_id, create_date)
VALUES
(1,'user1@gmail.com','user1','Nguyen Van A',1,1,'2026-08-01'),
(2,'user2@gmail.com','user2','Tran Thi B',2,2,'2026-08-01'),
(3,'user3@gmail.com','user3','Le Van C',3,3,'2026-08-02'),
(4,'user4@gmail.com','user4','Pham Thi D',4,4,'2026-08-02'),
(5,'user5@gmail.com','user5','Hoang Van E',5,1,'2026-08-03');
INSERT INTO `group`
(group_id, group_name, creator_id, create_date)
VALUES
(1,'Java',1,'2026-08-01'),
(2,'C#',2,'2026-08-01'),
(3,'Python',3,'2026-08-02'),
(4,'SQL',4,'2026-08-02'),
(5,'Testing',5,'2026-08-03');
INSERT INTO group_account
(group_id, account_id, join_date)
VALUES
(1,1,'2026-08-01'),
(2,2,'2026-08-01'),
(3,3,'2026-08-02'),
(4,4,'2026-08-02'),
(5,5,'2026-08-03');
INSERT INTO type_question
(type_id, type_name)
VALUES
(1,'ESSAY'),
(2,'MULTIPLE_CHOICE'),
(3,'ESSAY'),
(4,'MULTIPLE_CHOICE'),
(5,'ESSAY');
INSERT INTO category_question
(category_id, category_name)
VALUES
(1,'Java'),
(2,'SQL'),
(3,'Python'),
(4,'C#'),
(5,'Testing');
INSERT INTO question
(question_id, content, category_id, type_id, creator_id, create_date)
VALUES
(1,'Java la gi?',1,1,1,'2026-08-03'),
(2,'SQL la gi?',2,2,2,'2026-08-03'),
(3,'Python dung de lam gi?',3,1,3,'2026-08-03'),
(4,'C# thuoc nen tang nao?',4,2,4,'2026-08-03'),
(5,'Testing la gi?',5,1,5,'2026-08-03');
INSERT INTO answer
(answer_id, content, question_id, is_correct)
VALUES
(1,'Ngon ngu lap trinh',1,'TRUE'),
(2,'He quan tri CSDL',2,'TRUE'),
(3,'Ngon ngu Python',3,'TRUE'),
(4,'.NET',4,'TRUE'),
(5,'Kiem thu phan mem',5,'TRUE');
INSERT INTO exam
(exam_id, `code`, title, category_id, duration, creator_id, create_date)
VALUES
(1,'EX001','Java Basic',1,60,1,'2026-08-03'),
(2,'EX002','SQL Basic',2,45,2,'2026-08-03'),
(3,'EX003','Python Basic',3,60,3,'2026-08-03'),
(4,'EX004','C# Basic',4,90,4,'2026-08-03'),
(5,'EX005','Testing Basic',5,30,5,'2026-08-03');
INSERT INTO exam_question
(exam_id, question_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);    
-- QUERY DATA
SELECT version();
SELECT * FROM `account`;
	
    