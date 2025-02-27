# Oracle Database Assignment II  

## 📌 Introduction  
- **Student ID**: 25947  
- **Name**: Gakuru Libenz  
- **Group**: B  
- **Course**: Oracle Database Administration  

## 📝 Problem Statement  
This database is designed for a **Student Course Enrollment System**, which manages students, courses, instructors, and enrollments. The system allows:  
- Storing student records, including personal details and enrollment history.  
- Keeping track of available courses and their assigned instructors.  
- Handling enrollments to link students with courses and track registration dates.  
- Managing transactions such as adding new students, updating enrollments, and querying records.  

 📊 Conceptual Diagram  
Attached is the conceptual diagram showing table relationships:  

**Tables and Relationships:**  
1. **Students**: Stores student details (one-to-many with enrollments).  
2. **Courses**: Stores course information (one-to-many with enrollments).  
3. **Instructors**: Stores instructor details (one-to-many with courses).  
4. **Enrollments**: Tracks student-course registrations (many-to-many).  

## ⚙️ SQL Commands Executed  
The following SQL operations were executed in the Oracle database:  

### **1️⃣ Creating Tables**  
```sql
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    enrollment_date DATE
);

INSERT INTO Students (student_id, student_name, enrollment_date) 
VALUES (1, 'Cesar Libenz', SYSDATE);

UPDATE Students SET student_name = 'Jane Doe' WHERE student_id = 1;
DELETE FROM Students WHERE student_id = 1;

SELECT s.student_name, c.course_name 
FROM Students s 
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

SELECT s.student_name, c.course_name 
FROM Students s 
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

SELECT * FROM Students WHERE enrollment_date >= SYSDATE - 7;

SELECT course_id, COUNT(student_id) AS total_enrollments 
FROM Enrollments 
GROUP BY course_id 
ORDER BY total_enrollments DESC 
FETCH FIRST 5 ROWS ONLY;

SELECT student_id, COUNT(course_id) AS course_count 
FROM Enrollments 
GROUP BY student_id 
HAVING COUNT(course_id) > 3;

