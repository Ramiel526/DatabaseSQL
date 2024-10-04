-- TRIGGER for change of address
create or replace trigger address_update
before update of address on student
for each row
begin
	insert into address_history (student_id, old_address, DateOfChange)
	values (:old.student_id, :old.address, sysdate);
end;
/

-- deletion of student record
create or replace trigger student_history
before delete on student for each row
begin
	insert into student_history (student_id, student_name, dob)
	values (:old.student_id, :old.student_name, :old.dob);
end;
/
