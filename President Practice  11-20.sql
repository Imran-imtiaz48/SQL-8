-- 11. List presidents, spouses, and number of children in marriages with more than 5 children
SELECT pres_name, spouse_name, nr_children
FROM pres_marriage
WHERE nr_children > 5
ORDER BY nr_children DESC;

-- 12. Show presidents and spouses where the president was about 20 years old and the spouse not over 20
SELECT pres_name, spouse_name, pr_age, sp_age
FROM pres_marriage
WHERE pr_age <= 20
  AND sp_age <= 20
ORDER BY pr_age, sp_age;

-- 13. Show presidents and spouses with the same age, sorted by spouse's age
SELECT pres_name, spouse_name, pr_age, sp_age
FROM pres_marriage
WHERE pr_age = sp_age
ORDER BY sp_age;

-- 14. Show the average age of presidents at marriage
SELECT AVG(pr_age) AS avg_president_marriage_age
FROM pres_marriage;

-- 15. Show the average number of children for presidents married after 1900
SELECT AVG(nr_children) AS avg_children_after_1900
FROM pres_marriage
WHERE mar_year > 1900;

-- 16. Show the average number of votes of winners in 20th-century elections
SELECT AVG(votes) AS avg_winner_votes_20th_century
FROM election
WHERE election_year BETWEEN 1901 AND 2000
  AND winner_loser_indic = 'W';

-- 17. Show how many distinct elections were held
SELECT COUNT(DISTINCT election_year) AS total_elections
FROM election;

-- 18. Number of losing candidates
SELECT COUNT(DISTINCT candidate) AS total_losers
FROM election
WHERE winner_loser_indic = 'L';

-- 18b. List candidates who never won an election
SELECT DISTINCT candidate
FROM election 
WHERE winner_loser_indic = 'L'
  AND candidate NOT IN (
      SELECT DISTINCT candidate
      FROM election
      WHERE winner_loser_indic = 'W'
  )
ORDER BY candidate;

-- 19. Show the number of original states (entered at founding)
SELECT COUNT(*) AS original_states
FROM state
WHERE admin_entered IS NULL;

-- 20. Show average life expectancy of Republican presidents born after 1850
SELECT AVG(death_age) AS avg_republican_life_expectancy
FROM president
WHERE party = 'Republican'
  AND birth_yr > 1850;
