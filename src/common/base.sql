-- 1. Crear la base de datos

CREATE DATABASE bootcamp_db;

-- 2. Crear la tabla students

CREATE TABLE "students" (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    "updatedAt" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

-- 3. Crear la Tabla courses

CREATE TABLE "courses" (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    "updatedAt" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

-- 4. Crear la Tabla enrollments

CREATE TABLE "enrollments" (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES "students"(id) ON DELETE CASCADE,
    course_id INT REFERENCES "courses"(id) ON DELETE CASCADE,
    grade VARCHAR(5),
    "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    "updatedAt" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

-- 5. Relaciones entre las Tablas

-- - **Relación uno a muchos**: `students` y `enrollments`
--     - Un estudiante puede estar inscrito en varios cursos.
--     - Un curso puede tener varios estudiantes inscritos.
-- - **Relación muchos a muchos**: `students` y `courses` a través de la tabla `enrollments`
--     - Esto se logra con las llaves foráneas `student_id` y `course_id` en la tabla `enrollments`.

-- 6. Verificar la Estructura

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- 7. Inserciones de data base
-- 7.1. Inserciones de tabla estudiantes
INSERT INTO "students" (first_name, last_name, email, "createdAt", "updatedAt") VALUES
('John', 'Doe', 'johndoe@example.com', NOW(), NOW()),
('Jane', 'Smith', 'janesmith@example.com', NOW(), NOW()),
('Michael', 'Johnson', 'michaelj@example.com', NOW(), NOW()),
('Emily', 'Davis', 'emilydavis@example.com', NOW(), NOW()),
('Chris', 'Brown', 'chrisbrown@example.com', NOW(), NOW());

-- 7.2. Inserciones de tabla cursos
INSERT INTO "courses" (title, description, "createdAt", "updatedAt") VALUES
('Introduction to Programming', 'Learn the basics of programming using Python.', NOW(), NOW()),
('Web Development', 'Build and design websites using HTML, CSS, and JavaScript.', NOW(), NOW()),
('Database Design', 'Understand database concepts and learn SQL.', NOW(), NOW()),
('Data Structures and Algorithms', 'Explore common data structures and algorithms.', NOW(), NOW()),
('Machine Learning', 'Introduction to machine learning concepts and tools.', NOW(), NOW());

-- 7.3. Inserciones de tabla inscripciones
INSERT INTO "enrollments" (student_id, course_id, grade, "createdAt", "updatedAt") VALUES
(1, 1, 'A', NOW(), NOW()),
(1, 3, 'B', NOW(), NOW()),
(2, 2, 'A', NOW(), NOW()),
(2, 4, 'A', NOW(), NOW()),
(3, 1, 'B', NOW(), NOW()),
(3, 2, 'C', NOW(), NOW()),
(4, 5, 'A', NOW(), NOW()),
(5, 3, 'B', NOW(), NOW()),
(5, 4, 'A', NOW(), NOW());