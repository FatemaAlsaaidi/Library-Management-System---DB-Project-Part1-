-- ========= create database =======
create database LibrarySystem

-- ========== use database ========
use LibrarySystem

--   ======== create tables =========

-- Libraries table
create table libraries
(
library_id int primary key IDENTITY,
name varchar(10) not null UNIQUE, 
established_year varchar(4) not null,
location varchar(20) not null
);

create table library_ContactPhone
(
library_id int not null,
Contact_phone varchar(8) not null
primary key(library_id, Contact_phone)
);

create table staff
(
staff_id int primary key IDENTITY,
F_name varchar(8) not null,
N_name varchar(8) not null,
L_name varchar(8) not null, 
position varchar(20) not null,
contact_number varchar(8) not null, 
library_id int not null
);


create table books
(
book_id int primary key identity,
ISBM int not null unique,
title varchar(20) unique not null,
genre VARCHAR(20) not null,
CONSTRAINT chk_genre CHECK (Genre IN ('Fiction', 'Non-fiction', 'Reference', 'Children')),
price decimal (6,3) not null check (price > 000.000),
avail_status BIT DEFAULT 1,               -- 1 = TRUE
shelf_location  varchar(10) not null, 
library_id int not null
);

create table member
(
member_id int primary key identity,
F_name varchar(10) not null, 
M_name varchar(10) not null, 
L_name varchar(10) not null, 
member_email varchar(20) not null unique,
member_phone varchar(20) not null unique, 
mem_start_date date not null
);

create table MemberBookReviews
(
book_id int not null,
member_id int not null,
review_number int not null,
primary key(book_id, member_id)
);

create table reviews
(
review_number int primary key identity,
rating decimal (2,1) not null,
review_date date not null,
commands varchar(255) not null DEFAULT 'No comments'
);

create table loan
(
loan_id int not null, 
book_id int not null,
member_id int not null,
loan_date date not null,
due_date date not null,
return_date date not null,
status varchar(10) not null default 'issued',
primary key(loan_id, book_id, member_id)
);

create table BookLoans
(
loan_id int not null,
book_id int not null,
member_id int not null
primary key(loan_id, book_id, member_id)
);

create table Payments
(
pay_id int primary key,
loan_date date not null,
amount decimal (6,3) not null check(amount > 000.000),
method varchar(10) not null
);

create table loan_pay
(
loan_id int not null,
pay_id int not null,
book_id int not null,
member_id int not null
);
-- ================================== foriegn key ====================
-- libraries_contactPhone table
alter table library_ContactPhone
add foreign key (library_id) references libraries(library_id) on delete cascade on update cascade

-- staff table 
alter table staff
add foreign key (library_id) references libraries(library_id) on delete cascade on update cascade

-- books table 
alter table books
add foreign key (library_id) references libraries(library_id) on delete cascade on update cascade

-- Reviews (books_member) table 
alter table MemberBookReviews
add foreign key (member_id) references member(member_id) on delete cascade on update cascade

-- Reviews (books_member) table 
alter table MemberBookReviews
add foreign key (book_id) references books(book_id) on delete cascade on update cascade

-- Reviews (books_member) table 
alter table MemberBookReviews
add foreign key (review_number) references reviews(review_number) on delete cascade on update cascade

-- loan table 
alter table loan
add foreign key (book_id) references books(book_id) on delete cascade on update cascade

-- loan table 
alter table loan
add foreign key (member_id) references member(member_id) on delete cascade on update cascade

-- BookLoans table
alter table BookLoans
add foreign key (loan_id, book_id, member_id) references loan(loan_id, book_id, member_id) on delete cascade on update cascade

-- loan_pay table 
alter table loan_pay
add foreign key (loan_id, book_id, member_id) references BookLoans(loan_id, book_id, member_id) on delete cascade on update cascade

alter table loan_pay
add foreign key (pay_id) references Payments(pay_id) on delete cascade on update cascade

