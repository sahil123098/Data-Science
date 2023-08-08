use assignment;

select * from property_price_train_new;

#----Q1----
Update property_price_train_new set Sale_Price = Sale_Price * 1.15 Where Sale_condition = "Normal";

#----Q2----
Alter table  property_price_train_new modify BsmtUnfSF VARCHAR (30);

#----Q3----  
SELECT lpad( convert(Garage_Size , char) , 4, "0")  from property_price_train_new;

#----Q4----
SELECT
Brick_Veneer_Area, Brick_Veneer_Type 
FROM Property_Price_Train_new  
WHERE Brick_Veneer_Type NOT IN ('None','BrkCmn');

#----Q5----
Select W_Deck_Area from Property_Price_Train_new where W_Deck_Area < 0;

#----Q6----
Select Brick_Veneer_Type from Property_Price_Train_new where Brick_Veneer_Type like '____e';

#----Q7----
SELECT REPLACE(Pool_Quality,'NA','null') AS Pool_Quality_new 
FROM Property_Price_Train_new;

#Q7
select count(Pool_Quality) from Property_Price_Train_new where Pool_Quality = 'NA';
select count(Miscellaneous_Feature) from Property_Price_Train_new where Miscellaneous_Feature = 'NA';

#----Q8----
ALTER TABLE Property_Price_Train_new
    DROP COLUMN Pool_Quality,
    DROP COLUMN Miscellaneous_Feature;
    
#----Q9----
SELECT table_schema 'db_name',
round(((data_length + index_length) / 1024 / 1024), 2) AS  "Size (MB)"
FROM information_schema.TABLES 
GROUP BY table_schema;

#----Q10----
select Brick_Veneer_Area, Exterior_Material, BsmtFinSF1, Remodel_Year 
from property_price_train_new where Remodel_Year between 1950 and 1976;

#----Q11----
SELECT Brick_Veneer_Area,Exterior_Material,BsmtFinSF1,Remodel_Year,Sale_Price
       FROM property_price_train_new WHERE Sale_Price > 
	        (SELECT AVG(Sale_Price) FROM property_price_train_new);
            
select * from employee_details;

#----Q12----
CREATE VIEW check_id AS
SELECT employee_id, first_name, last_name
FROM  employee_details
WHERE manager_id between 100 and 114
WITH CHECK OPTION;
select * from check_id;

#----Q13----
UPDATE check_id
   SET employee_id = '113'
    WHERE first_name = 'Bob' and last_name = 'Tan';
    
#----Q14----
delete from check_age1
where employee_id = '104';
select * from check_age1;

#----Q15----
SELECT employee_id , first_name,last_name,phone_number,salary, job_id
FROM employee_details
WHERE DEPARTMENT_ID NOT IN(
SELECT DEPARTMENT_ID FROM Department_Details
WHERE DEPARTMENT_NAME='Contracting');

#----Q16----
 SELECT FIRST_NAME, LAST_NAME,DEPARTMENT_ID 
   FROM employee_details WHERE DEPARTMENT_ID= ANY
   (SELECT DEPARTMENT_ID FROM Department_Details WHERE LOCATION_ID=1700); 

#----Q17----
SELECT employee_id, FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_ID 
FROM employee_details E 
WHERE EXISTS (SELECT * FROM employee_details WHERE MANAGER_ID = E.EMPLOYEE_ID);

#----Q18----
SELECT email, email REGEXP '^[A-Za-z0-9._%\-+!#$&/=?^|~]+@[A-Za-z0-9.-]+[.][A-Za-z]+$' AS valid_email FROM employee_details;