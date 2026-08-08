-- QUERY DATA
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT a.*, d.department_name
FROM `account` a
JOIN department d
ON a.department_id = d.department_id;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT *
FROM `account`
WHERE create_date > '2010-12-20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT a.*
FROM `account` a
JOIN `position` p
ON a.position_id = p.position_id
WHERE p.position_name = 'DEV';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có > 3 nhân viên
SELECT
    d.department_name,
    COUNT(a.account_id) AS total_employee
FROM department d
JOIN `account` a
ON d.department_id = a.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(a.account_id) > 3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT
    q.question_id,
    q.content,
    COUNT(eq.exam_id) AS total_exam
FROM question q
JOIN exam_question eq
ON q.question_id = eq.question_id
GROUP BY q.question_id, q.content
ORDER BY total_exam DESC
LIMIT 1;

-- Question 6: Thống kê mỗi category question được sử dụng trong bao nhiêu question
SELECT
    cq.category_name,
    COUNT(q.question_id) AS total_question
FROM category_question cq
LEFT JOIN question q
ON cq.category_id = q.category_id
GROUP BY cq.category_id, cq.category_name;

-- Question 7: Thống kê mỗi question được sử dụng trong bao nhiêu exam
SELECT
    q.question_id,
    q.content,
    COUNT(eq.exam_id) AS total_exam
FROM question q
LEFT JOIN exam_question eq
ON q.question_id = eq.question_id
GROUP BY q.question_id, q.content;

-- Question 8: Lấy ra question có nhiều câu trả lời nhất
SELECT
    q.question_id,
    q.content,
    COUNT(a.answer_id) AS total_answer
FROM question q
JOIN answer a
ON q.question_id = a.question_id
GROUP BY q.question_id, q.content
ORDER BY total_answer DESC
LIMIT 1;

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT
    g.group_name,
    COUNT(ga.account_id) AS total_account
FROM `group` g
LEFT JOIN group_account ga
ON g.group_id = ga.group_id
GROUP BY g.group_id, g.group_name;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT
    p.position_name,
    COUNT(a.account_id) AS total_account
FROM `position` p
LEFT JOIN `account` a
ON p.position_id = a.position_id
GROUP BY p.position_id, p.position_name
ORDER BY total_account
LIMIT 1;

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu Dev, Test, Scrum Master, PM
SELECT
    d.department_name,
    SUM(p.position_name = 'DEV') AS total_dev,
    SUM(p.position_name = 'TEST') AS total_test,
    SUM(p.position_name = 'SCRUM_MASTER') AS total_scrum_master,
    SUM(p.position_name = 'PM') AS total_pm
FROM department d
LEFT JOIN `account` a
ON d.department_id = a.department_id
LEFT JOIN `position` p
ON a.position_id = p.position_id
GROUP BY d.department_id, d.department_name;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm thông tin cơ bản,
-- loại câu hỏi, người tạo và câu trả lời
SELECT
    q.question_id,
    q.content,
    tq.type_name,
    a.full_name,
    ans.content AS answer_content
FROM question q
JOIN type_question tq
ON q.type_id = tq.type_id
JOIN `account` a
ON q.creator_id = a.account_id
LEFT JOIN answer ans
ON q.question_id = ans.question_id;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT
    tq.type_name,
    COUNT(q.question_id) AS total_question
FROM type_question tq
LEFT JOIN question q
ON tq.type_id = q.type_id
GROUP BY tq.type_id, tq.type_name;

-- Question 14: Lấy ra group không có account nào
SELECT g.*
FROM `group` g
LEFT JOIN group_account ga
ON g.group_id = ga.group_id
WHERE ga.account_id IS NULL;

-- Question 15: Lấy ra group không có account nào
SELECT g.*
FROM `group` g
LEFT JOIN group_account ga
ON g.group_id = ga.group_id
WHERE ga.account_id IS NULL;

-- Question 16: Lấy ra question không có answer nào
SELECT q.*
FROM question q
LEFT JOIN answer a
ON q.question_id = a.question_id
WHERE a.answer_id IS NULL;