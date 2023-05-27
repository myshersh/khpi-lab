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
        schedule_id INTEGER NOT NULL,
        lesson_date DATE NOT NULL,
        class_name VARCHAR(8) NOT NULL,
        classroom INTEGER NOT NULL,
        lesson_number INTEGER NOT NULL,
        lesson_name VARCHAR(50) NOT NULL,
        CONSTRAINT schedule_pk PRIMARY KEY (schedule_id),
        CONSTRAINT classes_fk FOREIGN KEY (class_id) REFERENCES classes (class_id)
        CONSTRAINT lessons_fk FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id)
    );

    CREATE TABLE classes (
        class_id INTEGER GENERATED ALWAYS AS IDENTITY,
        class_name VARCHAR(8) NOT NULL,
        CONSTRAINT visits_pk PRIMARY KEY (visit_id),
        CONSTRAINT rooms_fk FOREIGN KEY (room_id) REFERENCES rooms (room_id)
    );

    CREATE TABLE ratings (
        rating_id INTEGER GENERATED ALWAYS AS IDENTITY,
        lesson_name VARCHAR(50) NOT NULL,
        rating_first_quarter INTEGER NOT NULL,
        rating_second_quarter INTEGER NOT NULL,
        rating_third_quarter INTEGER NOT NULL,
        rating_fourth_quarter INTEGER NOT NULL,
        CONSTRAINT visits_pk PRIMARY KEY (visit_id),
        CONSTRAINT rooms_fk FOREIGN KEY (room_id) REFERENCES rooms (room_id)
    );