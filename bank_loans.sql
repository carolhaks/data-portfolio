CREATE DATABASE bank_loans;
use bank_loans;


CREATE TABLE customers_tmp (
  MemberID VARCHAR(50),
  FirstName VARCHAR(200),
  LastName VARCHAR(200),
  EmploymentStatus VARCHAR(200),
  Occupation VARCHAR(200),
  MemNo VARCHAR(50),
  DepositAmount VARCHAR(50),
  DateOfDeposit VARCHAR(50),
  Gender VARCHAR(20),
  Age VARCHAR(10)
);

select *from customers;
drop table loans;
CREATE TABLE loans (
    LoanID VARCHAR(10) PRIMARY KEY,
    MemNo VARCHAR(50),
    LoanAmount DECIMAL(12,2),
    LoanStatus VARCHAR(50),
    LoanType VARCHAR(100),
    DateRequested DATE,
    RepaymentPeriodMonths INT,
    InterestRate DECIMAL(5,2)
);



ALTER TABLE loans MODIFY COLUMN LoanID VARCHAR(10);


ALTER TABLE loans
ADD COLUMN InterestRate DECIMAL(5, 2);
 
 alter table loans
 drop column Interestedrate;
 


select * from loans_tmp;
use bank_loans;
SELECT * FROM customers;
select firstname,lastname,depositamount from customers;
select * FROM  customers WHERE gender='female';
select *FROM customers WHERE age <'30';
select*FROM customers WHERE depositamount >'10000';
select *FROM customer WHERE occupation = 'student';
SELECT * FROM Customers WHERE Occupation = 'Student';
select * FROM customers where depositamount ='7800';  
select * from customers WHERE MONTH(Dateofdeposit)=3 AND YEAR(dateofdeposit) =2025;
select *from customers order by age desc;
select distinct Employmentstatus from customers;
select count(*) as totalcustomers from customers;
select avg(depositamount) as averagedeposit from customers;
update Customers SET DepositAmount = DepositAmount + 1000 WHERE MemNo = 'M004'; 
SET SQL_SAFE_UPDATES = 0; 
INSERT INTO Customers(
MemberID, FirstName, LastName, EmploymentStatus, Occupation, 
    MemNo, DepositAmount, DateOfDeposit, Gender, Age )
values('41','james','kamau','employed', 'manager', 
    'M041','20000', '4/6/2025',' male', '36');
delete from customers WHERE MEMNO= 'M020';
DROP TABLE Loans;


SELECT c.FirstName, c.LastName,  
       SUM(l.LoanAmount) AS TotalLoanAmount 
FROM Customers c 
LEFT JOIN Loans l ON c.MemNo = l.MemNo 
GROUP BY c.FirstName, c.LastName; 

SELECT c.FirstName, c.LastName, COUNT(l.LoanID) AS LoanCount 
FROM Customers c 
JOIN Loans l ON c.MemNo = l.MemNo 
GROUP BY c.FirstName, c.LastName 
HAVING COUNT(l.LoanID) > 1; 

SELECT LoanType, COUNT(*) AS ApplicationCount 
FROM Loans 
GROUP BY LoanType;

WITH LoanRanks AS ( 
    SELECT LoanID, LoanType, LoanAmount, 
           RANK() OVER (PARTITION BY LoanType ORDER BY LoanAmount DESC) AS rnk 
    FROM Loans 
) 
SELECT * FROM LoanRanks 
WHERE rnk = 1; 
use bank_loans;

ALTER TABLE loans 
MODIFY LoanID VARCHAR(10);


INSERT INTO loans 
(LoanID, MemNo, LoanAmount, LoanStatus, Loantype, Daterequested, Repaymentperiodmonths, Interestrate)
VALUES
('L002','M006', 28000, 'Pending', 'Emergency', '2025-03-15', 12, 14),
('L003','M012', 35000, 'Approved', 'Business', '2025-04-20', 18, 13),
('L004','M001', 25000, 'Rejected', 'Emergency', '2025-05-12', 6, 15.5),
('L005','M017', 18000, 'Approved', 'School Fees', '2025-06-10', 10, 12),
('L006','M022', 60000, 'Approved', 'Development', '2025-07-04', 36, 11),
('L007','M005', 22000, 'Pending', 'Medical', '2025-08-01', 12, 14.5),
('L008','M038', 15000, 'Approved', 'Business', '2025-08-17', 9, 13.5),
('L009','M006', 42000, 'Approved', 'Car Loan', '2025-09-03', 30, 11.5),
('L010','M019', 30000, 'Rejected', 'Emergency', '2025-09-20', 6, 15),
('L011','M033', 70000, 'Approved', 'Development', '2025-10-11', 48, 10.5),
('L012','M025', 27000, 'Approved', 'School Fees', '2025-10-28', 8, 13),
('L013','M012', 15000, 'Pending', 'Emergency', '2025-11-09', 6, 14.5),
('L014','M034', 31000, 'Approved', 'Medical', '2025-11-22', 24, 12),
('L015','M040', 26000, 'Approved', 'Business', '2025-12-05', 18, 13),
('L016','M006', 10000, 'Pending', 'Emergency', '2025-12-20', 6, 16);

select*from loans;





    


