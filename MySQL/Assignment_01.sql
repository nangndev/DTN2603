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
-- Question 1: Thêm ít nhất 10 record vào mỗi table ( tổng 15 bảng)
INSERT INTO department(department_id, department_name)
VALUES
(1, 'sale'), 
(2, 'giám đốc'), 
(3, 'bảo vệ'), 
(4, 'thư kí'), 
(5, 'tài chính'),
(6, 'Nhân sự'),
(7, 'Marketing'),
(8, 'Kế toán'),
(9, 'Kỹ thuật'),
(10, 'R&D'),
(11, 'Vận hành'),
(12, 'Chăm sóc khách hàng'),
(13, 'Pháp chế'),
(14, 'Kiểm toán'),
(15, 'Thiết kế');
INSERT INTO `position`(position_id, position_name)
VALUES
(1, 'DEV'),
(2, 'TEST'),
(3, 'SCRUM_MASTER'),
(4, 'PM'),
(5, 'DEV'),
(6, 'TEST'),
(7, 'SCRUM_MASTER'),
(8, 'PM'),
(9, 'DEV'),
(10, 'TEST'),
(11, 'SCRUM_MASTER'),
(12, 'PM'),
(13, 'DEV'),
(14, 'TEST'),
(15, 'TEST');
INSERT INTO `account`
(account_id, email, user_name, full_name, department_id, position_id, create_date)
VALUES
(1,'user1@gmail.com','user1','Nguyen Van A',1,1,'2026-08-01'),
(2,'user2@gmail.com','user2','Tran Thi B',2,2,'2026-08-01'),
(3,'user3@gmail.com','user3','Le Van C',3,3,'2026-08-02'),
(4,'user4@gmail.com','user4','Pham Thi D',4,4,'2026-08-02'),
(5,'user5@gmail.com','user5','Hoang Van E',5,1,'2026-08-03'),
(6, 'user6@gmail.com', 'user6', 'Vu Van F', 6, 1, '2026-08-04'),
(7, 'user7@gmail.com', 'user7', 'Đoan Thi G', 7, 2, '2026-08-04'),
(8, 'user8@gmail.com', 'user8', 'Bui Van H', 8, 3, '2026-08-04'),
(9, 'user9@gmail.com', 'user9', 'Ngo Thi I', 9, 4, '2026-08-04'),
(10, 'user10@gmail.com', 'user10', 'Dinh Van K', 10, 1, '2026-08-04'),
(11, 'user11@gmail.com', 'user11', 'Trinh Thi L', 11, 2, '2026-08-04'),
(12, 'user12@gmail.com', 'user12', 'Phung Van M', 12, 3, '2026-08-04'),
(13, 'user13@gmail.com', 'user13', 'Ly Thi N', 13, 4, '2026-08-04'),
(14, 'user14@gmail.com', 'user14', 'Mai Van O', 14, 1, '2026-08-04'),
(15, 'user15@gmail.com', 'user15', 'Cao Thi P', 3, 2, '2026-08-04');
INSERT INTO `group`
(group_id, group_name, creator_id, create_date)
VALUES
(1,'Java',1,'2026-08-01'),
(2,'C#',2,'2026-08-01'),
(3,'Python',3,'2026-08-02'),
(4,'SQL',4,'2026-08-02'),
(5,'Testing',5,'2026-08-03'),
(6, 'ReactJS', 6, '2026-08-04'),
(7, 'NodeJS', 7, '2026-08-04'),
(8, 'DevOps', 8, '2026-08-04'),
(9, 'Flutter', 9, '2026-08-04'),
(10, 'Golang', 10, '2026-08-04'),
(11, 'PHP', 11, '2026-08-04'),
(12, 'VueJS', 12, '2026-08-04'),
(13, 'Angular', 13, '2026-08-04'),
(14, 'Docker', 14, '2026-08-04'),
(15, 'Kubernetes', 15, '2026-08-04');
INSERT INTO group_account
(group_id, account_id, join_date)
VALUES
(1,1,'2026-08-01'),
(2,2,'2026-08-01'),
(3,3,'2026-08-02'),
(4,4,'2026-08-02'),
(5,5,'2026-08-03'),
(6, 6, '2026-08-04'),
(7, 7, '2026-08-04'),
(8, 8, '2026-08-04'),
(9, 9, '2026-08-04'),
(10, 10, '2026-08-04'),
(11, 11, '2026-08-04'),
(12, 12, '2026-08-04'),
(13, 13, '2026-08-04'),
(14, 14, '2026-08-04'),
(15, 15, '2026-08-04');
INSERT INTO type_question
(type_id, type_name)
VALUES
(1,'ESSAY'),
(2,'MULTIPLE_CHOICE'),
(3,'ESSAY'),
(4,'MULTIPLE_CHOICE'),
(5,'ESSAY'),
(6, 'MULTIPLE_CHOICE'),
(7, 'ESSAY'),
(8, 'MULTIPLE_CHOICE'),
(9, 'ESSAY'),
(10, 'MULTIPLE_CHOICE'),
(11, 'ESSAY'),
(12, 'MULTIPLE_CHOICE'),
(13, 'ESSAY'),
(14, 'ESSAY'),
(15, 'ESSAY');
INSERT INTO category_question
(category_id, category_name)
VALUES
(1,'Java'),
(2,'SQL'),
(3,'Python'),
(4,'C#'),
(5,'Testing'),
(6, 'ReactJS'),
(7, 'NodeJS'),
(8, 'DevOps'),
(9, 'Flutter'),
(10, 'Golang'),
(11, 'PHP'),
(12, 'VueJS'),
(13, 'Angular'),
(14, 'Docker'),
(15, 'Kubernetes');
INSERT INTO question
(question_id, content, category_id, type_id, creator_id, create_date)
VALUES
(1,'Java la gi?',1,1,1,'2026-08-03'),
(2,'SQL la gi?',2,2,2,'2026-08-03'),
(3,'Python dung de lam gi?',3,1,3,'2026-08-03'),
(4,'C# thuoc nen tang nao?',4,2,4,'2026-08-03'),
(5,'Testing la gi?',5,1,5,'2026-08-03'),
(6, 'ReactJS Hooks la gi?', 6, 1, 6, '2026-08-04'),
(7, 'NodeJS la gi?', 7, 2, 7, '2026-08-04'),
(8, 'CI/CD trong DevOps la gi?', 8, 1, 8, '2026-08-04'),
(9, 'Widget trong Flutter la gi?', 9, 2, 9, '2026-08-04'),
(10, 'Goroutine trong Golang hoạt động như thế nào?', 10, 1, 10, '2026-08-04'),
(11, 'PHP Framework nao phổ biến nhất?', 11, 2, 11, '2026-08-04'),
(12, 'VueJS Directive la gi?', 12, 1, 12, '2026-08-04'),
(13, 'Angular Service dung de lam gi?', 13, 2, 13, '2026-08-04'),
(14, 'Docker Container khac gi VM?', 14, 1, 14, '2026-08-04'),
(15, 'Kubernetes Pod la gi?', 15, 2, 15, '2026-08-04');
INSERT INTO answer
(answer_id, content, question_id, is_correct)
VALUES
(1,'Ngon ngu lap trinh',1,'TRUE'),
(2,'He quan tri CSDL',2,'TRUE'),
(3,'Ngon ngu Python',3,'TRUE'),
(4,'.NET',4,'TRUE'),
(5,'Kiem thu phan mem',5,'TRUE'),
(6, 'La cac hàm cho phép dùng state trong Functional Component', 6, 'TRUE'),
(7, 'La JavaScript Runtime Environment', 7, 'TRUE'),
(8, 'Tự động hóa tích hợp và triển khai phần mềm', 8, 'TRUE'),
(9, 'Thành phần giao diện cơ bản trong Flutter', 9, 'TRUE'),
(10, 'Luồng thực thi mỏng do Go runtime quản lý', 10, 'TRUE'),
(11, 'Laravel', 11, 'TRUE'),
(12, 'Cú pháp đặc biệt chỉ định hành vi cho DOM', 12, 'TRUE'),
(13, 'Chia sẻ dữ liệu và logic giữa các Component', 13, 'TRUE'),
(14, 'Nhe hon và chia sẻ chung OS Kernel', 14, 'TRUE'),
(15, 'Đơn vị triển khai nhỏ nhất trong K8s', 15, 'TRUE');
INSERT INTO exam
(exam_id, `code`, title, category_id, duration, creator_id, create_date)
VALUES
(1,'EX001','Java Basic',1,60,1,'2026-08-03'),
(2,'EX002','SQL Basic',2,45,2,'2026-08-03'),
(3,'EX003','Python Basic',3,60,3,'2026-08-03'),
(4,'EX004','C# Basic',4,90,4,'2026-08-03'),
(5,'EX005','Testing Basic',5,30,5,'2026-08-03'),
(6, 'EX006', 'ReactJS Basic', 6, 60, 6, '2026-08-04'),
(7, 'EX007', 'NodeJS Basic', 7, 45, 7, '2026-08-04'),
(8, 'EX008', 'DevOps Basic', 8, 90, 8, '2026-08-04'),
(9, 'EX009', 'Flutter Basic', 9, 60, 9, '2026-08-04'),
(10, 'EX010', 'Golang Basic', 10, 60, 10, '2026-08-04'),
(11, 'EX011', 'PHP Basic', 11, 45, 11, '2026-08-04'),
(12, 'EX012', 'VueJS Basic', 12, 60, 12, '2026-08-04'),
(13, 'EX013', 'Angular Basic', 13, 90, 13, '2026-08-04'),
(14, 'EX014', 'Docker Basic', 14, 45, 14, '2026-08-04'),
(15, 'EX015', 'Kubernetes Basic', 15, 60, 15, '2026-08-04');
INSERT INTO exam_question
(exam_id, question_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);  
