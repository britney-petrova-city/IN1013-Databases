--1
SELECT cust_name
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
JOIN restStaff ON restStaff.headwaiter = restStaff.staff_no
WHERE restStaff.first_name = 'Charles' AND restBill.bill_total > 450.00;

--2
SELECT CONCAT(restStaff.first_name, ' ', restStaff.surname) AS Waiter
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
JOIN restStaff ON restStaff.headwaiter = restStaff.staff_no
WHERE restBill.cust_name = 'Nerida' AND restBill.bill_date = '160111';

--3
SELECT cust_name
FROM restBill
WHERE bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);

--4
SELECT first_name, surname
FROM restStaff
LEFT JOIN restBill ON restStaff.staff_no = restBill.waiter_no
WHERE restBill.waiter_no IS NULL;

--5
SELECT restBill.cust_name, restRoom_management.room_name, CONCAT(restStaff.first_name, ' ', restStaff.surname) AS Waiter
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
JOIN restRoom_management ON restBill.bill_date = restRoom_management.room_date
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restBill.bill_total = (
    SELECT MAX(bill_total)
    FROM restBill
);