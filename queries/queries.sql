
-- =========================================================
-- SQL Practice Queries
-- Database: test_db
-- DBMS: MySQL 8.0
--
-- Exercises are arranged from basic JOIN queries
-- to more advanced queries involving filtering,
-- aggregation, and multiple table relationships.
-- =========================================================


-- =========================================================
-- 01. Display all courses and the names of their instructors.
-- Tables: courses, instructors
-- =========================================================

SELECT
    courses.course_name,
    instructors.name AS instructor_name
FROM courses
JOIN instructors
    ON instructors.id = courses.instructor_id;


-- =========================================================
-- 02. Display each student's first name, last name,
-- and the names of all courses they are enrolled in.
-- Tables: students, enrollments, courses
-- =========================================================

SELECT
    students.first_name,
    students.last_name,
    courses.course_name
FROM students
JOIN enrollments
    ON enrollments.student_id = students.id
JOIN courses
    ON courses.id = enrollments.course_id;


-- =========================================================
-- 03. Display each student's first name, last name,
-- and project name.
-- Tables: students, projects
-- =========================================================

SELECT
    students.first_name,
    students.last_name,
    projects.project_name
FROM students
LEFT JOIN projects
    ON projects.student_id = students.id;


-- =========================================================
-- 04. Display students and the grades they received
-- for their courses.
-- Tables: students, grades
-- =========================================================

SELECT
    students.first_name,
    students.last_name,
    grades.grade
FROM students
JOIN grades
    ON students.id = grades.student_id;


-- =========================================================
-- 05. Display the course name, category,
-- and instructor name.
-- Tables: courses, instructors
-- =========================================================

SELECT
    courses.course_name,
    courses.category,
    instructors.name AS instructor_name
FROM courses
JOIN instructors
    ON courses.instructor_id = instructors.id;


-- =========================================================
-- 06. Display students' names, course names,
-- and their last attendance dates.
-- Tables: students, enrollments, courses
-- =========================================================

SELECT
    students.first_name,
    students.last_name,
    courses.course_name,
    enrollments.last_attendance_date
FROM students
JOIN enrollments
    ON students.id = enrollments.student_id
JOIN courses
    ON courses.id = enrollments.course_id;


-- =========================================================
-- 07. Display course names and the grades received
-- in each course, without displaying student names.
-- Tables: courses, grades
-- =========================================================

SELECT
    courses.course_name,
    grades.grade
FROM courses
JOIN grades
    ON courses.id = grades.course_id;


-- =========================================================
-- 08. Display students' first names, last names,
-- and the semesters in which they are enrolled.
-- Tables: students, enrollments
-- =========================================================

SELECT
    students.first_name,
    students.last_name,
    enrollments.semester
FROM students
JOIN enrollments
    ON students.id = enrollments.student_id;


-- =========================================================
-- 09. Display the course name, student's name,
-- and the student's grade for that course.
-- Tables: grades, students, courses
-- =========================================================

SELECT
    courses.course_name,
    students.first_name,
    students.last_name,
    grades.grade
FROM grades
JOIN students
    ON students.id = grades.student_id
JOIN courses
    ON courses.id = grades.course_id;


-- =========================================================
-- 10. Display instructor names and the names of all courses
-- they teach in the 'Computer Science' category.
-- Tables: courses, instructors
-- =========================================================

SELECT
    instructors.name AS instructor_name,
    courses.course_name
FROM courses
JOIN instructors
    ON instructors.id = courses.instructor_id
WHERE courses.category = 'Computer Science';


-- =========================================================
-- 11. Display all instructors and the courses they teach,
-- including instructors who do not teach any courses.
-- Tables: instructors, courses
-- =========================================================

SELECT
    instructors.name AS instructor_name,
    courses.course_name
FROM instructors
LEFT JOIN courses
    ON instructors.id = courses.instructor_id;


-- =========================================================
-- 12. Find all students enrolled in courses
-- in the 'Computer Science' category.
-- Tables: enrollments, courses, students
-- =========================================================

SELECT
    students.first_name,
    students.last_name,
    courses.course_name
FROM enrollments
JOIN courses
    ON enrollments.course_id = courses.id
JOIN students
    ON students.id = enrollments.student_id
WHERE courses.category = 'Computer Science';


-- =========================================================
-- 13. Display the student's name, course name,
-- and the name of the instructor teaching that course.
-- Tables: enrollments, students, courses, instructors
-- =========================================================

SELECT
    students.first_name,
    students.last_name,
    courses.course_name,
    instructors.name AS instructor_name
FROM enrollments
JOIN students
    ON students.id = enrollments.student_id
JOIN courses
    ON courses.id = enrollments.course_id
JOIN instructors
    ON instructors.id = courses.instructor_id;


-- =========================================================
-- 14. Display the number of students enrolled in each course.
-- Tables: enrollments, courses
-- =========================================================

SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM enrollments
JOIN courses
    ON courses.id = enrollments.course_id
GROUP BY courses.id, courses.course_name;


-- =========================================================
-- 15. Display the number of courses taught by each instructor.
-- Tables: courses, instructors
-- =========================================================

SELECT
    instructors.name AS instructor_name,
    COUNT(courses.id) AS number_of_courses
FROM courses
JOIN instructors
    ON instructors.id = courses.instructor_id
GROUP BY instructors.id, instructors.name;


-- =========================================================
-- 16. Display students who received an 'A' grade,
-- along with the names of the courses.
-- Tables: grades, students, courses
-- =========================================================

SELECT
    students.first_name,
    students.last_name,
    courses.course_name,
    grades.grade
FROM grades
JOIN students
    ON students.id = grades.student_id
JOIN courses
    ON courses.id = grades.course_id
WHERE grades.grade = 'A';


-- =========================================================
-- 17. Display each student's name and the number
-- of courses they are enrolled in.
-- Tables: students, enrollments
-- =========================================================

SELECT
    students.first_name,
    students.last_name,
    COUNT(enrollments.course_id) AS number_of_courses
FROM students
LEFT JOIN enrollments
    ON enrollments.student_id = students.id
GROUP BY students.id, students.first_name, students.last_name;


-- =========================================================
-- 18. Display students' names, their project names,
-- and the names of the courses they attend.
-- Tables: students, projects, enrollments, courses
-- =========================================================

SELECT
    students.first_name,
    students.last_name,
    projects.project_name,
    courses.course_name
FROM students
LEFT JOIN projects
    ON projects.student_id = students.id
LEFT JOIN enrollments
    ON enrollments.student_id = students.id
LEFT JOIN courses
    ON courses.id = enrollments.course_id;
