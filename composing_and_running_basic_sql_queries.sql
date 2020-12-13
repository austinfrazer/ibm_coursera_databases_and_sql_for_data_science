-- task 0
drop table instructor;

-- task 1
create table instructor (
	ins_id INTEGER PRIMARY KEY NOT NULL,
	lastname VARCHAR(15) NOT NULL,
	firstname VARCHAR(15) NOT NULL,
	city VARCHAR(15),
	country CHAR(2)
);

-- task 2a
insert into instructor(ins_id, lastname, firstname, city, country)
	values(1, 'Ahuja', 'Rav', 'Toronto', 'CA');

-- task 2b
insert into instructor(ins_id, lastname, firstname, city, country)
	values	(2, 'Chong', 'Raul', 'Toronto', 'CA'),
				(3, 'Vasudevan', 'Hima', 'Chicago', 'US');

-- task 3
select * from instructor;

-- task 3b
select firstname, lastname, country
from instructor
where city = 'Toronto';

-- Task 4
update instructor
set city = 'Markham'
where firstname = 'Rav';

-- Task 5
delete from instructor where firstname = 'Raul';

-- Task 5b
select * from instructor;
