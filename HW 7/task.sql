--1
CREATE VIEW samsBills AS
SELECT restStaff.first_name, restStaff.surname, restBill.bill_date, restBill.cust_name, restBill.bill_total
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
WHERE restStaff.first_name = 'Sam' AND restStaff.surname = 'Pitt';

--2
SELECT first_name, surname, bill_date, cust_name, bill_total
FROM samsBills
WHERE bill_total > 400;

--3
CREATE VIEW roomTotals AS
SELECT restRoom_management.room_name AS room_name, SUM(restBill.bill_total) AS total_sum
FROM restRoom_management
JOIN restBill ON restRoom_management.room_date = restBill.bill_date
GROUP BY restRoom_management.room_name;

--4
CREATE VIEW teamTotals AS
SELECT CONCAT(restStaff.first_name, ' ', restStaff.surname) AS headwaiter_name, SUM(restBill.bill_total) AS total_sum
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
JOIN restStaff ON restStaff.headwaiter = restStaff.staff_no
GROUP BY restStaff. staff_no;