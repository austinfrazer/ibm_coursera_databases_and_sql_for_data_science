--Exercise 2: Aggregate Functions
--Query A1: Enter a function that calculates the total cost of all animal rescues in the PETRESCUE table.
select sum(cost) AS total_cost from petrescue;  -- I just chose this alias based on the words "total cost."

--Query A2: Enter a function that displays the total cost of all animal rescues in the PETRESCUE table in a column called SUM_OF_COST.
select sum(cost) AS sum_of_cost from petrescue;

--Query A3: Enter a function that displays the maximum quantity of animals rescued.
select max(quantity) AS max_num_rescued from petrescue;

--Query A4: Enter a function that displays the average cost of animals rescued.
select avg(cost) AS avg_cost from petrescue;

--Query A5: Enter a function that displays the average cost of rescuing a dog.
select avg(cost/quantity) AS avg_cost_per_animal from petrescue where animal = 'Dog';


-- Exercise 3: Scalar and String Functions
-- Query B1: Enter a function that displays the rounded cost of each rescue.
select round(cost,0) AS cost_dollar_round from petrescue;

--Query B2: Enter a function that displays the length of each animal name.
select length(animal) AS word_length, animal from petrescue;

--Query B3: Enter a function that displays the animal name in each rescue in uppercase.
select ucase(animal) AS uppercase_animal from petrescue;

--Query B4: Enter a function that displays the animal name in each rescue in uppercase without duplications.
select distinct ucase(animal) AS uppercase_animal from petrescue;

--Query B5: Enter a query that displays all the columns from the PETRESCUE table,
--   where the animal(s) rescued are cats. Use cat in lower case in the query.
select * from petrescue where lcase(animal) = 'cat';


--Exercise 4: Date and Time Functions
--Query C1: Enter a function that displays the day of the month when cats have been rescued.
select day(rescuedate) from petrescue where animal = 'Cat';

--Query C2: Enter a function that displays the number of rescues on the 5th day of the month.
select count(id) from petrescue where day(rescuedate) = 5;

--Query C3: Animals rescued should see the vet within three days of arrivals.
--   Enter a function that displays the third day from each rescue.
select rescuedate, date(rescuedate + 3) AS see_vet_by_this_date from petrescue;

-- Query C4: Enter a function that displays the length of time the animals
--    have been rescued; the difference between today’s date and the rescue date.
select current_date AS today_date, rescuedate, (days(current_date) - days(rescuedate)) AS days_since_rescue
from petrescue order by (days(current_date) - days(rescuedate)) desc;
