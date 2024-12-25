-- Given 2 tables, Students and Grades. 
--   Students contains three columns ID, Name and Marks.
--   Grades contains Grade, Min_Mark, and Max_Mark

-- Challenge:
-- Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
-- Ketty doesn't want the NAMES of those students who received a grade lower than 8. >> change to 'NULL'
-- The report must be in descending order by grade -- i.e. higher grades are entered first. 
-- If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. 
-- Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. 
-- If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

SELECT 
  CASE WHEN b.Grade < 8 THEN 'NULL' ELSE a.Name END, 
  b.Grade, 
  a.Marks
FROM STUDENTS a, GRADES b
WHERE a.marks >= b.min_mark AND a.marks <= b.max_mark
ORDER BY b.Grade DESC, a.Name ASC;
