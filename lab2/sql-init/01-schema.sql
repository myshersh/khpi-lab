DROP DATABASE IF EXISTS school;

CREATE ROLE "suser" LOGIN PASSWORD 'password';

CREATE DATABASE school ENCODING 'UTF-8' LC_COLLATE 'en_US.UTF-8' LC_CTYPE 'en_US.UTF-8' TEMPLATE template0 OWNER "suser";

\connect school;
SET ROLE "suser";

    CREATE TABLE classes (
        class_id INTEGER GENERATED ALWAYS AS IDENTITY,
        class_name VARCHAR(8) NOT NULL,
        CONSTRAINT classes_pk PRIMARY KEY (class_id)
    );

    CREATE TABLE classrooms (
        classroom_id INTEGER GENERATED ALWAYS AS IDENTITY,
        room_number VARCHAR(8) NOT NULL,
        CONSTRAINT classroom_pk PRIMARY KEY (classroom_id)
    );

    CREATE TABLE teachers (
        teacher_id INTEGER GENERATED ALWAYS AS IDENTITY,
        last_name VARCHAR(50) NOT NULL,
        first_name VARCHAR(50) NOT NULL,
        classroom_id INTEGER,
        status VARCHAR(8) NOT NULL DEFAULT 'active'
            CONSTRAINT teacher_status_ck CHECK (status IN ('active', 'inactive')),
        CONSTRAINT teachers_pk PRIMARY KEY (teacher_id, classroom_id),
        CONSTRAINT classrooms_fk FOREIGN KEY (classroom_id) REFERENCES classrooms (classroom_id)
    );

    CREATE TABLE students (
        student_id INTEGER GENERATED ALWAYS AS IDENTITY,
        last_name VARCHAR(50) NOT NULL,
        first_name VARCHAR(50) NOT NULL,
        class_id INTEGER NOT NULL,
        rating_id INTEGER NOT NULL,
        status VARCHAR(8) NOT NULL DEFAULT 'active'
            CONSTRAINT student_status_ck CHECK (status IN ('active', 'inactive')),
        CONSTRAINT students_pk PRIMARY KEY (student_id),
        CONSTRAINT classes_fk FOREIGN KEY (class_id) REFERENCES classes (class_id)
    );

    CREATE TABLE lessons (
        lesson_id INTEGER GENERATED ALWAYS AS IDENTITY,
        lesson_name VARCHAR(50) NOT NULL,
        teacher_id INTEGER NOT NULL,
        CONSTRAINT lesson_pk PRIMARY KEY (lesson_id)
    );

    CREATE TABLE schedule (
        schedule_id INTEGER NOT NULL,
        lesson_date DATE NOT NULL,
        class_id VARCHAR(8) NOT NULL,
        classroom_id INTEGER NOT NULL,
        lesson_number INTEGER NOT NULL,
        lesson_name VARCHAR(50) NOT NULL,
        teacher_id INTEGER NOT NULL,
        lesson_id INTEGER NOT NULL,
        CONSTRAINT schedule_pk PRIMARY KEY (schedule_id, class_id, teacher_id, lesson_id, classroom_id),
        CONSTRAINT classes_fk FOREIGN KEY (class_id) REFERENCES classes (class_id),
        CONSTRAINT lessons_fk FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id),
        CONSTRAINT teachers_fk FOREIGN KEY (teacher_id) REFERENCES teachers (teacher_id),
        CONSTRAINT classrooms_fk FOREIGN KEY (classroom_id) REFERENCES classrooms (classroom_id)
    );

    CREATE TABLE ratings (
        rating_id INTEGER GENERATED ALWAYS AS IDENTITY,
        lesson_name VARCHAR(50) NOT NULL,
        rating_first_quarter INTEGER NOT NULL,
        rating_second_quarter INTEGER NOT NULL,
        rating_third_quarter INTEGER NOT NULL,
        rating_fourth_quarter INTEGER NOT NULL,
        CONSTRAINT ratings_pk PRIMARY KEY (rating_id),
        CONSTRAINT students_fk FOREIGN KEY (rating_id) REFERENCES students (rating_id)
    );