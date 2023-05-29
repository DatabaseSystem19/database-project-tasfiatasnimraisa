set serveroutput on
declare 
b_no hospital_branch.branch_no%type;
loc hospital_branch.location%type;
eml VARCHAR(40);
begin
select branch_no,location,email into b_no,loc,eml from hospital_branch where branch_no=1;
dbms_output.put_line('Branch_no:'||b_no|| '     Location :'||loc || '   Email:'||eml);
end;
/

set serveroutput on
declare 
b_no hospital_branch.branch_no%type:=15;
loc hospital_branch.location%type:='savar';
cnt hospital_branch.contact_no%type:=676;
eml hospital_branch.email%type:='abc';
begin
insert into hospital_branch values(b_no,loc,cnt,eml);
end;
/

--row type
set serveroutput on
declare 
dept_row department%rowtype;
begin
select dept_id,dept_name,total_doc,dept_head,branch_no into dept_row.dept_id,dept_row.dept_name,dept_row.total_doc,dept_row.dept_head,dept_row.branch_no from department where dept_id=1;
end;
/
--cursor
set serveroutput on
declare 
cursor dept_cursor is select * from department;
dept_row department%rowtype;
begin
open dept_cursor;
fetch dept_cursor into dept_row.dept_id,dept_row.dept_name,dept_row.total_doc,dept_row.dept_head,dept_row.branch_no;
while dept_cursor%found loop
dbms_output.put_line('DEPT_id: '||dept_row.dept_id|| ' DEPT_name: '||dept_row.dept_name || ' Total_Doc: ' ||dept_row.total_doc|| ' dept_head'||dept_row.dept_head||'branch_no'||dept_row.branch_no);
dbms_output.put_line('Row count: '|| dept_cursor%rowcount);
fetch dept_cursor into dept_row.dept_id,dept_row.dept_name,dept_row.total_doc,dept_row.dept_head,dept_row.branch_no;
end loop;
close dept_cursor;
end;
/

SET SERVEROUTPUT ON

DECLARE
  counter NUMBER;
  a hospital_branch.branch_no%TYPE;
  TYPE NAMEARRAY IS VARRAY(5) OF hospital_branch.branch_no%TYPE;
  A_NAME NAMEARRAY := NAMEARRAY();
BEGIN
  counter := 1;
  FOR x IN 1..4 LOOP
    SELECT branch_no INTO a FROM hospital_branch WHERE branch_no = x;
    A_NAME.EXTEND();
    A_NAME(counter) := a;
    counter := counter + 1;
  END LOOP;

  counter := 1;
  WHILE counter <= A_NAME.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(A_NAME(counter));
    counter := counter + 1;
  END LOOP;
END;
/
SET SERVEROUTPUT ON
DECLARE 
   counter NUMBER := 1;
    a hospital_branch.branch_no%TYPE;
   TYPE NAMEARRAY IS VARRAY(5) OF hospital_branch.branch_no%TYPE;
   A_NAME NAMEARRAY:=NAMEARRAY(12, 15, 17,20, 21); 
  
BEGIN
   counter := 1;
   FOR x IN 1..4  
   LOOP
     SELECT branch_no INTO a FROM hospital_branch WHERE branch_no = x;
      A_NAME(counter) := a;
      counter := counter + 1;
   END LOOP;
   counter := 1;
   WHILE counter <= A_NAME.COUNT 
   LOOP 
      DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
      counter := counter + 1;
   END LOOP;
END;
/



DECLARE 
   counter NUMBER := 1;
    a hospital_branch.branch_no%TYPE;
   TYPE NAMEARRAY IS VARRAY(5) OF hospital_branch.branch_no%TYPE;
   A_NAME NAMEARRAY:=NAMEARRAY(12, 15, 17,20, 21); 
  
BEGIN
   counter := 1;
   FOR x IN 1..4  
   LOOP
     SELECT branch_no INTO a FROM hospital_branch WHERE branch_no = x;
    
	if a=1 
        then
        dbms_output.put_line(a  ||' INSIDE DHAKA');
      elsif a>=2 and a<4 
        then
        dbms_output.put_line(a ||' OUTSIDE DHAKA');
      else 
        dbms_output.put_line(a ||'NO BRANCH');
        end if;
   END LOOP;
 
  
END;
/
drop procedure proc2;
CREATE OR REPLACE PROCEDURE proc2(
  var1 IN NUMBER,
  var2 OUT NUMBER,
  var3 IN OUT NUMBER
)
AS
  t_show CHAR(30);
BEGIN
  t_show := 'From procedure: ';
   SELECT doc_code INTO var2 FROM appointment WHERE app_si = var1;
   var3 := var1 + 1; 
  DBMS_OUTPUT.PUT_LINE('doc_code is ' || var2 || '  app_si is ' || var1 || ' v3= ' || var3);
  
END;
/


SET SERVEROUTPUT ON
DECLARE 
 
  a appointment.app_si%type:=400;
   b appointment.doc_code%type;
  c number;
BEGIN
  proc2(a, b, c);
  
END;
/


drop function fun;
set serveroutput on
create or replace function fun(var1 in number) return varchar AS
value physician.doc_name%type;
begin
  select doc_name into value from physician where doc_code=var1; 
   return value;
end;
/
set serveroutput on
declare 
value varchar(20);
begin
value:=fun(1);
  DBMS_OUTPUT.PUT_LINE(value);
end;
/