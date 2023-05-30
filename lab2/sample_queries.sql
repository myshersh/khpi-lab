\connect school;
SET ROLE "suser";

-- Який предмет буде у заданому класі, у задану дату на заданому уроці?
SELECT l.lesson_name FROM schedule s
JOIN classes c ON c.class_id = s.class_id
JOIN lessons l ON l.lesson_id = s.lesson_id
WHERE s.lesson_date = :date AND s.lesson_number = :number AND c.class_name = :className

-- Хто з вчителів викладає у заданому класі?
SELECT DISTINCT t.last_name, t.first_name FROM schedule s
JOIN classes c ON c.class_id = s.class_id
JOIN teachers t ON t.teacher_id = s.teacher_id
WHERE c.class_name = :className

-- У якому кабінеті буде 5-й урок у якусь дату у деякого класу?
SELECT l.room_number FROM schedule s
JOIN classes c ON c.class_id = s.class_id
JOIN classrooms l ON l.classroom_id = s.classroom_id
WHERE s.lesson_date = :date AND s.lesson_number = :number AND c.class_name = :className

-- У яких класах викладає заданий предмет вчитель?
SELECT c.class_name FROM schedule s
JOIN classes c ON c.class_id = s.class_id
JOIN teachers t ON t.teacher_id = s.teacher_id
JOIN lessons l ON l.lesson_id = s.lesson_id
WHERE l.lesson_name = :name AND t.last_name = :lastName AND t.first_name = :fName

-- Розклад на заданий день тижня для вказаного класу?
SELECT l.lesson_name, k.room_number FROM schedule s
JOIN classes c ON c.class_id = s.class_id
JOIN lessons l ON l.lesson_id = s.lesson_id
JOIN classrooms k ON k.classroom_id = s.classroom_id
WHERE s.lesson_date = :date AND c.class_name = :className ORDER BY c.lesson_number ASC

-- Скільки учнів у вказаному класі?
SELECT COUNT(1) FROM students s
JOIN classes c ON c.class_id = s.class_id
WHERE c.class_name = :name