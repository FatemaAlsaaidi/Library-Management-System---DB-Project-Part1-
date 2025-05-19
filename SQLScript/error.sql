USE LibrarySystem

/*Try deleting a member who: 
• Has existing loans 
• Has written book reviews */

DELETE FROM member WHERE member_id=2;
SELECT * from member
select * from loan
select * from MemberBookReviews 

/*
Try deleting a book that: 
• Is currently on loan 
• Has multiple reviews attached to it
*/

delete from books where book_id =10;
SELECT * from books
select * from loan
select * from MemberBookReviews 

/*
Try inserting a loan for: 
• A member who doesn’t exist 
• A book that doesn’t exist 
*/

SELECT * from member
select * from loan
select * from books 

INSERT INTO loan (loan_id, book_id, member_id, loan_date, due_date, return_date, status)
VALUES
(10, 6,6, '2025-05-03', '2025-05-17', '2025-05-17', 'returned');

/*
Try updating a book’s genre to: 
• A value not included in your allowed genre list (e.g., 'Sci-Fi') 

*/

UPDATE books 
SET genre = 'Reference'
WHERE book_id = 1;

/*
Try inserting a payment with: 
• A zero or negative amount 
• A missing payment method 

*/

INSERT INTO Payments (pay_id, loan_date, amount, method)
VALUES
(6, '2025-05-01', 1.00, 'cash');

/*

Try inserting a review for: 
• A book that does not exist 
• A member who was never registered

*/
INSERT INTO MemberBookReviews (book_id, member_id, review_number) VALUES
(8, 5, 1);

select*from books


/*
Try updating a foreign key field (like MemberID in Loan) to a value that doesn’t exist.

*/

select * from loan
UPDATE loan 
SET member_id = 8
