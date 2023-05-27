DROP DATABASE IF EXISTS labs;

CREATE ROLE "school-user" LOGIN PASSWORD 'password';

CREATE DATABASE labs ENCODING 'UTF-8' LC_COLLATE 'en_US.UTF-8' LC_CTYPE 'en_US.UTF-8' TEMPLATE template0 OWNER "school-user";

\connect school;
SET ROLE "school-user";

    CREATE TABLE teachers (
        teacher_id INTEGER GENERATED ALWAYS AS IDENTITY,
        last_name VARCHAR(50) NOT NULL,
        first_name VARCHAR(50) NOT NULL,
        status VARCHAR(8) NOT NULL DEFAULT 'active'
            CONSTRAINT employee_status_ck CHECK (status IN ('active', 'inactive')),
        CONSTRAINT employees_pk PRIMARY KEY (employee_id)
    );

    CREATE TABLE students (
        student_id INTEGER GENERATED ALWAYS AS IDENTITY,
        last_name VARCHAR(50) NOT NULL,
        first_name VARCHAR(50) NOT NULL,
        classroom INTEGER NOT NULL,
        CONSTRAINT students_pk PRIMARY KEY (student_id)
    );

    CREATE TABLE classrooms (
        classroom_id INTEGER GENERATED ALWAYS AS IDENTITY,
        room_number VARCHAR(4) NOT NULL,
        CONSTRAINT classroom_pk PRIMARY KEY (classroom_id),
        CONSTRAINT classroom_number_uk UNIQUE (classroom_number)
    );

    CREATE TABLE lessons (
            lesson_id INTEGER GENERATED ALWAYS AS IDENTITY,
            lesson_name VARCHAR(50) NOT NULL,
            CONSTRAINT lesson_pk PRIMARY KEY (lesson_id)
    );

    CREATE TABLE schedule (
        lesson_date DATE NOT NULL,
        class_number VARCHAR(8) NOT NULL,
        classroom INTEGER NOT NULL,
        lesson_number INTEGER NOT NULL,
        lesson_name VARCHAR(50) NOT NULL,
        schedule_date DATE NOT NULL,
        CONSTRAINT cleaning_schedule_pk PRIMARY KEY (employee_id, floor_number, schedule_date),
        CONSTRAINT employees_fk FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
    );

    CREATE TABLE visits (
        visit_id INTEGER GENERATED ALWAYS AS IDENTITY,
        room_id INTEGER NOT NULL,
        start_date DATE NOT NULL,
        end_date DATE,
        CONSTRAINT visits_pk PRIMARY KEY (visit_id),
        CONSTRAINT rooms_fk FOREIGN KEY (room_id) REFERENCES rooms (room_id)
    );

    CREATE TABLE visit_clients (
        visit_id INTEGER NOT NULL REFERENCES visits(visit_id),
        client_id INTEGER NOT NULL REFERENCES clients(client_id),
        CONSTRAINT visit_clients_pk PRIMARY KEY (visit_id, client_id),
        CONSTRAINT visit_clients_visit_fk FOREIGN KEY (visit_id) REFERENCES visits (visit_id),
        CONSTRAINT visit_clients_client_fk FOREIGN KEY (client_id) REFERENCES clients (client_id)
    );




