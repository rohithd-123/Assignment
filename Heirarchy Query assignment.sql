create table emp(
	empid int primary key,             -- Employee ID (Primary Key)
	empname varchar(30),               -- Employee Name
	managerid int);                    -- Manager's Employee ID (nullable for top-level manager)

-- Insert sample employee-manager hierarchy data
insert into emp values(1,'Tom',2),
					 (2,'Josh',NULL),  -- Josh is the top-level manager (no manager)
					 (3,'Mike',2),
					 (4,'John',3),
					 (5,'Pam',1),
					 (6,'Mary',3),
					 (7,'James',1),
					 (8,'Sam',5),
					 (9,'Simon',1)

declare @i int = 8; -- Input employee ID (Sam)

-- Recursive CTE to get the hierarchy chain up to top-most manager
with empcte(empid,empname,managerid,[level]) as(
	select empid, empname, managerid,1 from emp where empid=@i -- Anchor: start with input empid
	union all
	select emp.empid,emp.empname,emp.managerid,empcte.[level]+1 from emp join empcte on emp.empid = empcte.managerid -- Recursive: follow manager chain upward
	)
-- Final output: employee ID, name, manager name, hierarchy level
select e.empid as ID , e.empname as Employee , m.empname as Manager, e.[level] as HeirarchyLevel from empcte e left join empcte m on e.managerid=m.empid;
