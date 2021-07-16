DROP TABLE IF EXISTS "salaries";
DROP TABLE IF EXISTS "dept_manager";
DROP TABLE IF EXISTS "dept_emp";
DROP TABLE IF EXISTS "employees";
DROP TABLE IF EXISTS "titles";
DROP TABLE IF EXISTS "departments";

CREATE TABLE "departments" (
    "dept_no" char(4)   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "titles" (
    "title_id" char(5)   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" char(5)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" char(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" char(4)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" char(4)   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- 
-- COPY "departments" 
--     FROM 'data/departments.csv'
--     WITH 
--         CSV
--         DELIMITER ','
--         HEADER;

-- COPY "titles"
--     FROM 'data/titles.csv' 
--     WITH 
--         CSV
--         DELIMITER ','
--         HEADER;

-- COPY "employees"
--     FROM 'data/employees.csv' 
--     WITH 
--         CSV
--         DELIMITER ','
--         HEADER;

-- COPY "dept_emp"
--     FROM 'data/dept_emp.csv' 
--     WITH 
--         CSV
--         DELIMITER ','
--         HEADER;

-- COPY "dept_manager"
--     FROM 'data/dept_manager.csv' 
--     WITH 
--         CSV
--         DELIMITER ','
--         HEADER;

-- COPY "salaries"
--     FROM 'data/salaries.csv' 
--     WITH 
--         CSV
--         DELIMITER ','
--         HEADER;