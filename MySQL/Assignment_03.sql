
-- QUERY DATA
-- Question 1: Thêm ít nhất 10 record vào mỗi table
-- (Sử dụng 10 câu lệnh INSERT INTO cho mỗi bảng.)

-- Question 2: lấy ra tất cả các phòng ban
SELECT * FROM `department`;

-- Question 3: lấy ra id của phòng ban "Sale"
SELECT department_id
FROM department
WHERE department_name = 'Sale';

-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT *
FROM `account`
WHERE CHAR_LENGTH(full_name) = (
	SELECT MAX(CHAR_LENGTH(full_name))
    FROM `account`
);

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT *
FROM `account`
WHERE department_id = 3
AND CHAR_LENGTH(full_name) = (
	SELECT MAX(CHAR_LENGTH(full_name))
    FROM `account`
    WHERE department_id = 3
);

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT g.group_name
FROM `group` g
JOIN group_account ga
ON g.group_id = ga.group_id
WHERE ga.join_date < '2019-12-20';

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT question_id
FROM answer
GROUP BY question_id
HAVING COUNT(answer_id) >= 4;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT `code`
FROM exam
WHERE duration >= 60
AND create_date < '2019-12-20';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT *
FROM `group`
ORDER BY create_date DESC
LIMIT 5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(*) AS total_employee
FROM `account`
WHERE department_id = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT *
FROM `account`
WHERE full_name LIKE 'D%o';
-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM exam
WHERE create_date < '2019-12-20';

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "Câu hỏi"
DELETE FROM question
WHERE content LIKE 'Câu hỏi%';

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc"
-- và email thành loc.nguyenba@vti.com.vn
UPDATE `account`
SET
    full_name = 'Nguyễn Bá Lộc',
    email = 'loc.nguyenba@vti.com.vn'
WHERE account_id = 5;

-- Question 15: Update account có id = 5 sẽ thuộc group có id = 4
UPDATE group_account
SET group_id = 4
WHERE account_id = 5;