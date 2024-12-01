--1
SELECT bill_date, CONCAT(restStaff.first_name, ' ', restStaff.surname) AS Waiter, COUNT(restBill.bill_no) AS NumberOfBills
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
GROUP BY restBill.waiter_no, restBill.bill_date
HAVING COUNT(restBill.bill_no) >= 2;

--2
SELECT room_date, COUNT(table_no) AS NumberOfTables
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

--3
SELECT room_name, SUM(restBill.bill_total) AS TotalBillAmount
FROM restRoom_management
JOIN restBill ON restRoom_management.room_date = restBill.bill_date
GROUP BY restRoom_management.room_name;

--4
SELECT first_name, surname, SUM(restBill.bill_total) AS TotalBillAmount
FROM restStaff
JOIN restStaff ON restStaff.headwaiter = restStaff.staff_no
JOIN restBill ON restStaff.staff_no = restBill.waiter_no
GROUP BY restStaff.staff_no, restStaff.first_name, restStaff.surname
ORDER BY TotalBillAmount DESC;

--5
SELECT cust_name, AVG(bill_total) AS AverageBillTotal
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

--6
SELECT bill_date, CONCAT(restStaff.first_name, ' ', restStaff.surname) AS Waiter, COUNT(restBill.bill_no) AS NumberOfBills
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
GROUP BY restBill.waiter_no, restBill.bill_date
HAVING COUNT(restBill.bill_no) >= 3;