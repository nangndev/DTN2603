-- subquery
-- Question 1: Tạo view chứa danh sách nhân viên thuộc phòng ban Sale
CREATE VIEW view_account_sale AS
SELECT *
FROM `account`
WHERE department_id = (
    SELECT department_id
    FROM department
    WHERE department_name = 'Sale'
);


-- Question 2: Tạo view chứa thông tin các account tham gia vào nhiều group nhất
CREATE VIEW view_account_many_group AS
SELECT
    a.account_id,
    a.email,
    a.username,
    a.full_name,
    COUNT(ga.group_id) AS so_luong_group
FROM `account` a
JOIN group_account ga
ON a.account_id = ga.account_id
GROUP BY
    a.account_id,
    a.email,
    a.username,
    a.full_name
HAVING COUNT(ga.group_id) = (
    SELECT MAX(so_luong_group)
    FROM (
        SELECT COUNT(group_id) AS so_luong_group
        FROM group_account
        GROUP BY account_id
    ) AS temp
);


-- Question 3: Tạo view chứa các câu hỏi có content quá 300 từ
CREATE VIEW view_question_over_300_words AS
SELECT *
FROM question
WHERE (
    CHAR_LENGTH(TRIM(content))
    - CHAR_LENGTH(REPLACE(TRIM(content), ' ', ''))
    + 1
) > 300;

-- Xóa các câu hỏi có content quá 300 từ
DELETE FROM question
WHERE question_id IN (
    SELECT question_id
    FROM (
        SELECT question_id
        FROM question
        WHERE (
            CHAR_LENGTH(TRIM(content))
            - CHAR_LENGTH(REPLACE(TRIM(content), ' ', ''))
            + 1
        ) > 300
    ) AS temp
);


-- Question 4: Tạo view chứa các phòng ban có nhiều nhân viên nhất
CREATE VIEW view_department_many_account AS
SELECT
    d.department_id,
    d.department_name,
    COUNT(a.account_id) AS so_luong_nhan_vien
FROM department d
LEFT JOIN `account` a
ON d.department_id = a.department_id
GROUP BY
    d.department_id,
    d.department_name
HAVING COUNT(a.account_id) = (
    SELECT MAX(so_luong_nhan_vien)
    FROM (
        SELECT COUNT(account_id) AS so_luong_nhan_vien
        FROM `account`
        GROUP BY department_id
    ) AS temp
);


-- Question 5: Tạo view chứa tất cả các câu hỏi do user họ Nguyễn tạo
CREATE VIEW view_question_user_nguyen AS
SELECT *
FROM question
WHERE creator_id IN (
    SELECT account_id
    FROM `account`
    WHERE full_name LIKE 'Nguyễn %'
);
-- CTE
-- Question 1: Tạo view chứa danh sách nhân viên thuộc phòng ban Sale
CREATE VIEW view_account_sale_cte AS
WITH sale_department AS (
    SELECT department_id
    FROM department
    WHERE department_name = 'Sale'
)
SELECT a.*
FROM `account` a
JOIN sale_department s
ON a.department_id = s.department_id;


-- Question 2: Tạo view chứa thông tin các account tham gia vào nhiều group nhất
CREATE VIEW view_account_many_group_cte AS
WITH account_group_count AS (
    SELECT
        account_id,
        COUNT(group_id) AS so_luong_group
    FROM group_account
    GROUP BY account_id
),
max_group AS (
    SELECT MAX(so_luong_group) AS max_group
    FROM account_group_count
)
SELECT
    a.account_id,
    a.email,
    a.username,
    a.full_name,
    agc.so_luong_group
FROM `account` a
JOIN account_group_count agc
ON a.account_id = agc.account_id
JOIN max_group mg
ON agc.so_luong_group = mg.max_group;


-- Question 3: Tạo view chứa các câu hỏi có content quá 300 từ
CREATE VIEW view_question_over_300_words_cte AS
WITH long_question AS (
    SELECT question_id
    FROM question
    WHERE (
        CHAR_LENGTH(TRIM(content))
        - CHAR_LENGTH(REPLACE(TRIM(content), ' ', ''))
        + 1
    ) > 300
)
SELECT q.*
FROM question q
JOIN long_question lq
ON q.question_id = lq.question_id;


-- Question 4: Tạo view chứa các phòng ban có nhiều nhân viên nhất
CREATE VIEW view_department_many_account_cte AS
WITH department_count AS (
    SELECT
        d.department_id,
        d.department_name,
        COUNT(a.account_id) AS so_luong_nhan_vien
    FROM department d
    LEFT JOIN `account` a
    ON d.department_id = a.department_id
    GROUP BY
        d.department_id,
        d.department_name
),
max_department AS (
    SELECT MAX(so_luong_nhan_vien) AS max_nhan_vien
    FROM department_count
)
SELECT
    dc.department_id,
    dc.department_name,
    dc.so_luong_nhan_vien
FROM department_count dc
JOIN max_department md
ON dc.so_luong_nhan_vien = md.max_nhan_vien;


-- Question 5: Tạo view chứa tất cả các câu hỏi do user họ Nguyễn tạo
CREATE VIEW view_question_user_nguyen_cte AS
WITH user_nguyen AS (
    SELECT account_id
    FROM `account`
    WHERE full_name LIKE 'Nguyễn %'
)
SELECT q.*
FROM question q
JOIN user_nguyen u
ON q.creator_id = u.account_id;