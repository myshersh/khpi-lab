    \connect school;
    SET ROLE "school-user";

    INSERT INTO teachers (last_name, first_name, classroom_id)
    VALUES ('Smith', 'Viktoria', 201), ('Dorn', 'Joe', NULL);
