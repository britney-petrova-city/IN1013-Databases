--1
SELECT CONCAT(restStaff.first_name, ' ', restStaff.surname) AS Waiter
FROM restBill
JOIN restStaff ON restBill.waiter_no = restBill.staff_no
WHERE restBill.cust_name = 'Tanya Singh';

--2
SELECT room_date
FROM restRoom_management
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restStaff.first_name = 'Charles'
AND restRoom_management.room_name = 'Green'
AND restRoom_management.room_date LIKE '1602%';

--3
SELECT first_name, surname
FROM restStaff
WHERE headwaiter (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
)
AND staff_no != (
    SELECT staff_no
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

--4
SELECT cust_name, bill_total, CONCAT(restStaff.first_name, ' ', restStaff.surname) AS Waiter
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
ORDER BY restBill.bill_total DESC;

--5
SELECT CONCAT(restStaff.first_name, ' ', restStaff.surname ) AS Waiter
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
WHERE restStaff.headwaiter = (
    SELECT headwaiter
    FROM restBill
    JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
    WHERE bill_no IN ('00014', '00017')
);

--6
SELECT CONCAT(restStaff.first_name, ' ', restStaff.surname ) AS Waiter
FROM restStaff
WHERE headwaiter = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = '160312'
)
OR staff_no (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = '160312'
);