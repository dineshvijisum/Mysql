CREATE TABLE empoyee(
emp_id INT PRIMARY KEY,
first_name VARCHAR(40),
last_name VARCHAR(40),
birth_date  DATE,
sex VARCHAR(1),
salary INT,
super_id INT,
branch_id INT
);
DESCRIBE empoyee;
CREATE TABLE branch(
branch_id INT PRIMARY KEY,
branch_name VARCHAR(40),
mgr_id INT,
mgr_start_date DATE,
FOREIGN KEY(mgr_id)REFERENCES employee(emp_id)ON DELETE SET NULL
);
DESCRIBE branch;

ALTER TABLE empoyee
ADD FOREIGN KEY(super_id)
REFERENCES empoyee(emp_id)
ON DELETE SET NULL;

ALTER TABLE empoyee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

CREATE TABLE client(
client_id INT PRIMARY KEY,
client_name VARCHAR(40),
branch_id INT,
FOREIGN KEY(branch_id)REFERENCES branch(branch_id)ON DELETE SET NULL
);

CREATE TABLE works_with(
emp_id INT,
client_id INT,
total_sales INT,
PRIMARY KEY(emp_id,client_id),
FOREIGN KEY(emp_id)REFERENCES empoyee(emp_id)ON DELETE CASCADE,
FOREIGN KEY(client_id)REFERENCES client(client_id)ON DELETE CASCADE
);

CREATE TABLE branch_supplier(
branch_id INT,
supplier_name VARCHAR(40),
supply_type VARCHAR(40),
PRIMARY KEY(branch_id,supplier_name),
FOREIGN KEY(branch_id)REFERENCES branch(branch_id)ON DELETE CASCADE
);

INSERT INTO empoyee VALUES(100,'Dinesh','kumar','1996-01-19','M',3000000,NULL,NULL);
INSERT INTO branch VALUES(1,'corporate',100,'2010-01-19');
UPDATE empoyee
SET branch_id=1
WHERE emp_id=100;
INSERT INTO empoyee VALUES(101,'Dhoni','kumar','1981-07-19','M',300000,100,1);

SELECT * FROM empoyee;
SELECT * FROM branch;
INSERT INTO empoyee VALUES(102,'sachien','raj','1996-01-19','M',20000,101,1);
INSERT INTO branch VALUES(2,'vijisum',102,'2000-10-19');
UPDATE empoyee
SET branch_id=2
WHERE emp_id=102;
INSERT INTO empoyee VALUES(103,'Bumrah','dada','1921-04-19','M',700000,102,2);

INSERT INTO empoyee VALUES(104,'kholi','usuus','1941-04-22','M',500000,100,2);
INSERT INTO empoyee VALUES(105,'jadeja','uuu','1961-04-30','M',200000,102,1);
INSERT INTO empoyee VALUES(106,'shami','hdhr','1961-04-01','M',900000,100,2);

INSERT INTO empoyee VALUES(107,'raina','rose','1934-10-12','M',2000000,106,2);
INSERT INTO branch VALUES(3,'lohi',107,'2010-11-11');
UPDATE empoyee
SET branch_id=3
WHERE emp_id=107;
INSERT INTO empoyee VALUES(108,'kumar','raj','1933-05-01','M',7000,107,3);

INSERT INTO branch_supplier VALUES(2,'hammer','paper');
INSERT INTO branch_supplier VALUES(3,'patriot','pani');
INSERT INTO branch_supplier VALUES(3,'knife','customer');
INSERT INTO branch_supplier VALUES(3,'dinesh','kumar');
INSERT INTO branch_supplier VALUES(2,'data','base');

SELECT * FROM branch_supplier;
SELECT * FROM client;
INSERT INTO client VALUES(400,'gokul',2);
INSERT INTO client VALUES(401,'shakul',3);
INSERT INTO client VALUES(402,'koul',3);
INSERT INTO client VALUES(405,'rahul',2);

INSERT INTO works_with VALUES(105,400,949494);
INSERT INTO works_with VALUES(101,405,54545);
INSERT INTO works_with VALUES(100,401,666666);
INSERT INTO works_with VALUES(106,405,777777);
SELECT * FROM works_with;



