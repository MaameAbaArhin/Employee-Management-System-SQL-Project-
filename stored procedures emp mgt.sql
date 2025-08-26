--Stored Procedure for Salary Calculation
--This procedure calculates and inserts monthly payroll details for an employee.

CREATE PROCEDURE CalculateSalary
    @emp_id INT,
    @base_salary DECIMAL(10,2),
    @bonus DECIMAL(10,2),
    @deductions DECIMAL(10,2),
    @pay_date DATE
AS
BEGIN
    DECLARE @net DECIMAL(10,2);
    SET @net = @base_salary + @bonus - @deductions;

    INSERT INTO Payroll (EmpID, PayDate, BaseSalary, Bonus, Deductions, NetPay)
    VALUES (@emp_id, @pay_date, @base_salary, @bonus, @deductions, @net);
END;

EXEC CalculateSalary
    @emp_id = 3,
    @base_salary = 3000.00,
    @bonus = 500.00,
    @deductions = 300.00,
    @pay_date = '2025-06-15';
