The total score of a hacker is the sum of their maximum scores for all of the challenges. 
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 
If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
Exclude all hackers with a total score of 0 from your result.

The following tables contain contest data:
Hackers
The hacker_id is the id of the hacker
name is the name of the hacker.

Submissions
The submission_id is the id of the submission
hacker_id is the id of the hacker who made the submission
challenge_id is the id of the challenge for which the submission belongs to
score is the score of the submission.

SELECT h.hacker_id, h.name, SUM(max_scores.max_score) AS total_score
FROM Hackers h
JOIN (
        SELECT hacker_id, challenge_id, MAX(score) AS max_score
        FROM Submissions
        GROUP BY hacker_id, challenge_id
        ) max_scores 
ON h.hacker_id = max_scores.hacker_id
GROUP BY h.hacker_id, h.name
HAVING total_score > 0
ORDER BY total_score DESC, h.hacker_id;
