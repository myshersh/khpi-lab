    \connect school;
    SET ROLE "suser";

    INSERT INTO classrooms (room_number)
    VALUES (201), (202);

    INSERT INTO teachers (last_name, first_name, room_number)
    VALUES ('Smith', 'Viktoria', 201), ('Dorn', 'Joe', 202);
