CREATE TABLE IF NOT EXISTS teacher
(
    id        uuid NOT NULL,
    name      text NOT NULL,
    password  text NOT NULL,
    is_delete bool DEFAULT FALSE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS course
(
    id         uuid,
    name       text NOT NULL,
    credit     smallint,
    department text NOT NULL,
    teacher_id uuid NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (teacher_id) REFERENCES teacher (id)
);

CREATE TABLE IF NOT EXISTS student
(
    id         uuid NOT NULL,
    name       text NOT NULL,
    password   text NOT NULL,
    sex        text DEFAULT '未知',
    birthday   date,
    department text NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS student_course
(
    id          uuid NOT NULL,
    student_id  uuid NOT NULL,
    course_id   uuid NOT NULL,
    usual_grade smallint,
    exam_grade  smallint,
    grade       smallint,
    PRIMARY KEY (id),
    FOREIGN KEY (student_id) REFERENCES student (id),
    FOREIGN KEY (course_id) REFERENCES course (id)
)