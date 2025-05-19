USE LibrarySystem

-- insert values to libraries table
INSERT INTO libraries (name, established_year, location) VALUES
('NPL', '1975', 'Muscat'),
('SQU Lib', '1986', 'Al Khoudh'),
('SalalahLib', '1992', 'Salalah');

--display all data in libraries table 
select * from libraries

-- insert values to library_ContactPhone table 
INSERT INTO library_ContactPhone (library_id, Contact_phone) VALUES
(1, '24812345'),
(1, '24867890'),
(2, '24141234'),
(3, '23219876');

-- display all data in library_ContactPhone table
select * from library_ContactPhone

-- insert values staff table 
INSERT INTO staff (F_name, N_name, L_name, position, contact_number, library_id) VALUES
('Ali', 'Saeed', 'AlBalushi', 'Librarian', '99881234', 1),
('Maha', 'Hamed', 'AlHinai', 'Assistant', '99221100', 1),
('Ahmed', 'Salim', 'AlShanfari', 'Manager', '92334455', 2),
('Fatma', 'Nasser', 'AlBusaidi', 'Technician', '94775566', 3);

-- change size of F_name, M_name, L_name 
ALTER TABLE staff
ALTER COLUMN F_name VARCHAR(20);

ALTER TABLE staff
ALTER COLUMN N_name VARCHAR(20);

ALTER TABLE staff
ALTER COLUMN L_name VARCHAR(20);

-- insert value to book table, in avail_status : 1 means book in available (returned) , 0 means book is still loaded (borrow)
INSERT INTO books (ISBM, title, genre, price, avail_status, shelf_location, library_id) VALUES
(9781001, 'Desert Tales', 'Fiction', 4.500, 1, 'A1', 1),
(9781002, 'Oman History', 'Non-fiction', 6.750, 1, 'B2', 1),
(9781003, 'Math Guide', 'Reference', 3.250, 1, 'C3', 2),
(9781004, 'Science Fun', 'Children', 2.800, 1, 'D1', 2),
(9781005, 'Falaj Story', 'Fiction', 5.000, 0, 'A3', 3),
(9781006, 'World Atlas', 'Reference', 7.950, 1, 'C1', 3),
(9781007, 'Think Big', 'Non-fiction', 4.400, 1, 'B1', 3),
(9781008, 'Quran Kids', 'Children', 3.000, 1, 'D2', 1),
(9781009, 'Oman Myths', 'Fiction', 4.200, 0, 'A2', 1),
(9781010, 'Enviro Facts', 'Non-fiction', 6.100, 1, 'B3', 2);
select * from books

-- insert values to member table 
INSERT INTO member (F_name, M_name, L_name, member_email, member_phone, mem_start_date) VALUES
('Ali', 'Saeed', 'AlHarthy', 'ali.h@gmail.com', '99881234', '2023-01-15'),
('Maha', 'Ahmed', 'AlRaisi', 'maha.r@gmail.com', '99112233', '2023-03-20'),
('Salim', 'Nasser', 'AlBusaidi', 'salim.b@gmail.com', '99334455', '2023-05-10'),
('Fatma', 'Khalid', 'AlLawati', 'fatma.l@gmail.com', '99445566', '2023-07-01'),
('Hamed', 'Yousuf', 'AlFarsi', 'hamed.f@gmail.com', '99556677', '2023-08-25'),
('Aisha', 'Said', 'AlAbri', 'aisha.a@gmail.com', '99667788', '2023-10-02'),
('Nasser', 'Ali', 'AlHinai', 'nasser.h@gmail.com', '99778899', '2023-11-18');
select * from member

-- insert values to reviews table 
INSERT INTO reviews (rating, review_date, commands)
VALUES 
(4.5, '2025-05-10', 'Excellent and fast service. I thank the team for their assistance'),
(3.0, '2025-05-12', 'Very satisfied with the experience. I recommend dealing with them, especially in Muscat.'),
(5.0, '2025-05-14', 'The experience was below expectations. I hope they improve the quality of technical support.'),
(2.5, '2025-05-15', 'Good service. The staff is cooperative and understanding.'),
(4.0, '2025-05-17', 'Good service. The staff is cooperative and understanding.');
select * from reviews


-- insert values to MemberBookReviews table 
INSERT INTO MemberBookReviews (book_id, member_id, review_number) VALUES
(1, 5, 1),
(10, 6, 2),
(2, 5, 3),
(1, 3, 4),
(3, 7, 5),
(2, 2, 5);

-- it is not possible to have two members same review at same time so we have put review_number as unique 
alter table MemberBookReviews
ADD CONSTRAINT RN_UNIQUE UNIQUE(review_number);
-- drop the constrains 
ALTER TABLE MemberBookReviews
DROP CONSTRAINT RN_UNIQUE;


-- inseart values to payments table 
INSERT INTO Payments (pay_id, loan_date, amount, method)
VALUES
(1, '2025-05-01', 2.500, 'cash'),
(2, '2025-05-03', 1.750, 'card'),
(3, '2025-05-07', 3.000, 'online'),
(4, '2025-05-10', 2.250, 'cash'),
(5, '2025-05-12', 4.100, 'card');



-- inseart values to loan table 
INSERT INTO loan (loan_id, book_id, member_id, loan_date, due_date, return_date, status)
VALUES
(1, 1, 1, '2025-05-01', '2025-05-15', '2025-05-14', 'returned'),
(2, 2, 1, '2025-05-03', '2025-05-17', '2025-05-17', 'returned'),
(3, 3, 2, '2025-05-05', '2025-05-19', '2025-05-20', 'returned'),
(4, 4, 4, '2025-05-07', '2025-05-21', '2025-05-19', 'returned'),
(5, 5, 3, '2025-05-10', '2025-05-24', '2025-05-23', 'returned'),
(6, 6, 3, '2025-05-12', '2025-05-26', '2025-05-26', 'returned'),
(7, 7, 7, '2025-05-15', '2025-05-29', '2025-05-28', 'returned'),
(8, 8, 5, '2025-05-17', '2025-05-31', '2025-05-31', 'returned'),
(9, 9, 5, '2025-05-18', '2025-06-01', '2025-06-01', 'returned'),
(10,10, 4, '2025-05-19', '2025-06-02', '2025-06-03', 'returned');

select * from Payments

-- inseart values to BookLoan 
INSERT INTO BookLoans (loan_id, book_id, member_id)
VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 4),
(5, 5, 3),
(6, 6, 3);

-- inseart tables to loan_pay
INSERT INTO loan_pay (loan_id, pay_id, book_id, member_id)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 2);

-- Use DML to simulate real application behavior: 
-- Mark books as returned 
update books
set avail_status = 1
where ISBM = 9781005;

-- Update loan status 
UPDATE loan
SET status = 'Issued'
WHERE loan_id = 5;

select * from loan

-- Delete reviews/payments
DELETE FROM Reviews
WHERE review_number = 11;

select * from Reviews

DELETE FROM Payments
WHERE pay_id = 3;

select * from Payments
