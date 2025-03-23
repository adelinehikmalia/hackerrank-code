-- Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. 
-- Order your output by ascending company_code.

SELECT c.company_code, 
        c.founder, 
        COUNT(DISTINCT e.lead_manager_code) AS total_lead,
        COUNT(DISTINCT e.senior_manager_code) AS total_senior,
        COUNT(DISTINCT e.manager_code) AS total_manager,
        COUNT(DISTINCT e.employee_code) AS total_employee
FROM Company c, Employee e 
WHERE c.company_code = e.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code ASC;
