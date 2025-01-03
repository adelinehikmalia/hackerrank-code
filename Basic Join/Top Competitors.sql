-- Given the data
-- Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.
-- Difficulty: The difficult_level is the level of difficulty of the challenge, and score is the score of the challenge for the difficulty level.
-- Challenges: The challenge_id is the id of the challenge, the hacker_id is the id of the hacker who created the challenge, and difficulty_level is the level of difficulty of the challenge.
-- Submissions: The submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, challenge_id is the id of the challenge that the submission belongs to, and score is the score of the submission.

-- Challenge:
-- Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
-- Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. 
-- Order your output in descending order by the total number of challenges in which the hacker earned a full score. 
-- If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

SELECT a.hacker_id, a.name
FROM hackers a
  JOIN submissions b ON a.hacker_id = b.hacker_id
  JOIN challenges c ON c.challenge_id = b.challenge_id
  JOIN difficulty d ON d.difficulty_level = c.difficulty_level
WHERE b.score = d.score
GROUP BY a.hacker_id, a.name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC, a.hacker_id;
