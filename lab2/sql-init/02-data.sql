    \connect school;
    SET ROLE "suser";

    INSERT INTO classes (class_name)
    VALUES ('1A'), ('1B');

    INSERT INTO classrooms (room_number)
    VALUES (201), (202);

    INSERT INTO teachers (last_name, first_name, classroom_id)
    VALUES ('Smith', 'Viktoria', 1), ('Dorn', 'Joe', NULL);

    INSERT INTO students (last_name, first_name, class_id)
    VALUES ('Depp', 'Johnny', 1), ('Conor', 'Sara', 2);

    INSERT INTO lessons (lesson_name)
    VALUES ('Math'), ('Chemistry');

    INSERT INTO schedule (lesson_date, class_id, classroom_id, teacher_id, lesson_number, lesson_id)
    VALUES (current_date, 1, 1, 1, 1, 1), (current_date, 2, 2, 2, 2, 2);

    INSERT INTO ratings (student_id, lesson_id, rating_first_quarter, rating_second_quarter, rating_third_quarter, rating_fourth_quarter)
    VALUES (1, 1, 12, NULL, NULL, NULL), (2, 1, 9, NULL, NULL, NULL);