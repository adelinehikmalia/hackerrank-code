SELECT 
  CASE WHEN b.Grade < 8 THEN 'NULL' ELSE a.Name END, 
  b.Grade, 
  a.Marks
FROM STUDENTS a, GRADES b
WHERE a.marks >= b.min_mark AND a.marks <= b.max_mark
ORDER BY b.Grade DESC, a.Name ASC;
