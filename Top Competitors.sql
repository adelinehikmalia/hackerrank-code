SELECT a.hacker_id, a.name
FROM hackers a
  JOIN submissions b ON a.hacker_id = b.hacker_id
  JOIN challenges c ON c.challenge_id = b.challenge_id
  JOIN difficulty d ON d.difficulty_level = c.difficulty_level
WHERE b.score = d.score
GROUP BY a.hacker_id, a.name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC, a.hacker_id;
