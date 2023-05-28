\connect school;
SET ROLE "suser";

-- скільки вчителів без кабінету
SELECT COUNT(1) FROM teachers
WHERE NOT EXISTS (
    SELECT 1 FROM teachers
    WHERE classroom_id IS NULL
);