-- 1. Show names of presidents and ages when they passed away, sorted by age
SELECT pres_name, death_age
FROM president
WHERE death_age IS NOT NULL
ORDER BY death_age ASC;

-- 2. Show party and affiliated president names
SELECT party, pres_name
FROM president
ORDER BY party, pres_name;

-- 3. Show how old presidents were when they passed away, in descending order
SELECT pres_name, death_age
FROM president
WHERE death_age > 0
ORDER BY death_age DESC, pres_name ASC;

-- 4. Show presidents and spouses' ages, duplicates removed, sorted by president age then spouse age
SELECT DISTINCT pres_name, spouse_name, pr_age, sp_age
FROM pres_marriage
ORDER BY pr_age, sp_age;

-- 5. Show details of President Reagan
SELECT *
FROM president
WHERE pres_name = 'Reagan'
ORDER BY pres_name;

-- 6. Show details of every president except Reagan, sorted by name
SELECT *
FROM president
WHERE pres_name <> 'Reagan'
ORDER BY pres_name;

-- 7. Show details of presidents who died before age 70, sorted by descending age
SELECT *
FROM president
WHERE death_age < 70
ORDER BY death_age DESC;

-- 8. Show presidents named between Eisenhower and Nixon, sorted alphabetically
SELECT *
FROM president
WHERE pres_name BETWEEN 'Eisenhower' AND 'Nixon'
ORDER BY pres_name ASC;

-- 9. Show details of presidents who served 2, 4, 6, or 8 years
SELECT *
FROM president
WHERE yrs_serv IN (2, 4, 6, 8)
ORDER BY yrs_serv, pres_name;

-- 10. Show details of Republican presidents, ordered by name
SELECT *
FROM president
WHERE party = 'Republican'
ORDER BY pres_name ASC;
