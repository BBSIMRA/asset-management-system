-- TABLE: departments

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO departments (department_name, description) VALUES
('Human Resources', 'Handles employee and asset allocation'),
('IT', 'Manages technical infrastructure'),
('Finance', 'Handles company finances'),
('Operations', 'Manages daily operations'),
('Administration', 'General administration');


-- TABLE: employees

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_code VARCHAR(20) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    email VARCHAR(150),
    department_id INTEGER,
    designation VARCHAR(100),
    date_of_joining DATE,
    employment_status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO employees (employee_code, first_name, last_name, email, department_id, designation, date_of_joining, employment_status) VALUES
('EMP001', 'Ravi', 'Kumar', 'ravi.kumar@company.com', 2, 'Software Engineer', '2022-03-15', 'Active'),
('EMP002', 'Anita', 'Sharma', 'anita.sharma@company.com', 1, 'HR Executive', '2021-06-01', 'Active'),
('EMP003', 'Suresh', 'Patel', 'suresh.patel@company.com', 3, 'Accountant', '2020-01-10', 'Active'),
('EMP004', 'Meena', 'Iyer', 'meena.iyer@company.com', 4, 'Operations Manager', '2019-09-20', 'Active');


-- TABLE: hr_users

CREATE TABLE hr_users (
    hr_user_id SERIAL PRIMARY KEY,
    employee_id INTEGER,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO hr_users (employee_id, username, email) VALUES
(2, 'hr_anita', 'anita.sharma@company.com');



-- TABLE: admin_users

CREATE TABLE admin_users (
    admin_user_id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    role VARCHAR(50),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO admin_users (username, email, role) VALUES
('sysadmin', 'admin@company.com', 'System Administrator');


-- TABLE: asset_categories

CREATE TABLE asset_categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO asset_categories (category_name, description) VALUES
('Laptop', 'Company issued laptops'),
('Mobile Phone', 'Company issued mobile phones'),
('Monitor', 'External display units'),
('Furniture', 'Office furniture');


-- TABLE: assets

CREATE TABLE assets (
    asset_id SERIAL PRIMARY KEY,
    asset_tag VARCHAR(50) NOT NULL,
    asset_name VARCHAR(150),
    category_id INTEGER,
    brand VARCHAR(100),
    model VARCHAR(100),
    purchase_date DATE,
    asset_status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO assets (asset_tag, asset_name, category_id, brand, model, purchase_date, asset_status) VALUES
('AST-LAP-001', 'Dell Latitude Laptop', 1, 'Dell', 'Latitude 5420', '2022-02-10', 'Assigned'),
('AST-LAP-002', 'HP ProBook Laptop', 1, 'HP', 'ProBook 440', '2021-11-05', 'Available'),
('AST-MOB-001', 'Samsung Mobile', 2, 'Samsung', 'Galaxy S21', '2022-05-18', 'Assigned'),
('AST-MON-001', 'LG Monitor', 3, 'LG', '27UL500', '2021-08-25', 'Available');


-- TABLE: asset_assignments

CREATE TABLE asset_assignments (
    assignment_id SERIAL PRIMARY KEY,
    asset_id INTEGER,
    employee_id INTEGER,
    assigned_by_hr_id INTEGER,
    assigned_date DATE,
    expected_return_date DATE,
    actual_return_date DATE,
    assignment_status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO asset_assignments (asset_id, employee_id, assigned_by_hr_id, assigned_date, expected_return_date, assignment_status) VALUES
(1, 1, 1, '2022-03-16', '2025-03-15', 'Active'),
(3, 4, 1, '2022-06-01', '2024-06-01', 'Active');


-- TABLE: asset_status_history

CREATE TABLE asset_status_history (
    status_history_id SERIAL PRIMARY KEY,
    asset_id INTEGER,
    old_status VARCHAR(50),
    new_status VARCHAR(50),
    changed_by VARCHAR(100),
    change_reason TEXT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO asset_status_history (asset_id, old_status, new_status, changed_by, change_reason) VALUES
(1, 'Available', 'Assigned', 'hr_anita', 'Assigned to new employee'),
(3, 'Available', 'Assigned', 'hr_anita', 'Assigned for operational use'),
(2, 'Assigned', 'Available', 'sysadmin', 'Asset returned and inspected');
